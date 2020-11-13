package repo

import (
	"bufio"
	"bytes"
	"fmt"
	"github.com/getcouragenow/main/bootstrapper/service/go/pkg/fakedata"
	"github.com/getcouragenow/protoc-gen-cobra/client"
	"github.com/getcouragenow/protoc-gen-cobra/flag"
	"github.com/getcouragenow/protoc-gen-cobra/iocodec"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"
	"time"

	bsrpc "github.com/getcouragenow/main/bootstrapper/service/go/rpc/v2"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
)

func (b *BootstrapRepo) GenerateBSBypassCmd(cfg *client.Config) *cobra.Command {
	var fileExt string
	cmd := &cobra.Command{
		Use:   "gen-bs <json|yaml>",
		Short: "generate bootstrap file, will be saved to the bs directory, choose the format",
		Long:  "generate bootstrap file, will be saved to the bs directory, choose the format",
		RunE: func(cmd *cobra.Command, args []string) error {
			if cfg.UseEnvVars {
				if err := flag.SetFlagsFromEnv(cmd.Parent().PersistentFlags(), true, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService"); err != nil {
					return err
				}
				if err := flag.SetFlagsFromEnv(cmd.PersistentFlags(), false, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService", "Upload"); err != nil {
					return err
				}
			}
			id, err := b.GenBSFile(fileExt)
			if err != nil {
				return err
			}
			res := &bsrpc.BS{FileId: id, CreatedAt: timestamppb.New(time.Unix(0, sharedConfig.CurrentTimestamp()))}
			encoder := iocodec.JSONEncoderMaker(true)(os.Stdout)
			return encoder(res)
		},
	}
	cmd.PersistentFlags().StringVarP(&fileExt, "ext", "e", "json", "extension (yaml or json)")
	return cmd
}

func (b *BootstrapRepo) NewBootstrapUpload(cfg *client.Config) *cobra.Command {
	var fileName string
	cmd := &cobra.Command{
		Use:   "upload-bs",
		Short: "New Bootstrap RPC client",
		Long:  "New Bootstrap RPC client",
		RunE: func(cmd *cobra.Command, args []string) error {
			if cfg.UseEnvVars {
				if err := flag.SetFlagsFromEnv(cmd.Parent().PersistentFlags(), true, cfg.EnvVarNamer, cfg.EnvVarPrefix, "BSService"); err != nil {
					return err
				}
				if err := flag.SetFlagsFromEnv(cmd.PersistentFlags(), false, cfg.EnvVarNamer, cfg.EnvVarPrefix, "BSService", "NewBootstrap"); err != nil {
					return err
				}
			}
			return client.RoundTrip(cmd.Context(), cfg, func(cc grpc.ClientConnInterface, in iocodec.Decoder, out iocodec.Encoder) error {
				b.ChangeInterceptor(cc)
				cli := bsrpc.NewBSServiceClient(cc)
				v := &bsrpc.NewBSRequest{}

				abspath, err := filepath.Abs(fileName)
				if err != nil {
					return err
				}
				fileContent, err := ioutil.ReadFile(abspath)
				if err != nil {
					return err
				}
				// check if file is a valid fakedata
				bsAll := fakedata.BootstrapAll{}
				ext := filepath.Ext(fileName)
				switch ext {
				case ".yaml", ".yml":
					if err = sharedConfig.UnmarshalYAML(fileContent, &bsAll); err != nil {
						return err
					}
				case ".json":
					if err = sharedConfig.UnmarshalJson(fileContent, bsAll); err != nil {
						return err
					}
				default:
					return status.Errorf(codes.InvalidArgument, "file: %s is not valid yaml or json", fileName)
				}
				v.FileExtension = ext[1:]
				stm, err := cli.NewBootstrap(cmd.Context())
				if err != nil {
					return err
				}
				err = stm.Send(v)
				if err != nil {
					return err
				}
				reader := bufio.NewReader(bytes.NewBuffer(fileContent))
				buffer := make([]byte, chunkSize)
				for {
					var n int
					n, err = reader.Read(buffer)
					if err != nil {
						if err == io.EOF {
							break
						}
						return fmt.Errorf("cannot read chunk to buffer: %v", err)
					}
					v.BsRequest = buffer[:n]
					err = stm.Send(v)
					if err != nil {
						return fmt.Errorf("cannot send chunk to server: %v %v", err, stm.RecvMsg(nil))
					}
				}
				res, err := stm.CloseAndRecv()
				if err != nil {
					return err
				}
				return out(res)
			})
		},
	}
	cmd.PersistentFlags().StringVar(&fileName, cfg.FlagNamer("FilePath"), "newuploadbootstrap.yml", "file_path")
	return cmd
}

func (b *BootstrapRepo) ExecBSBypassCmd(cfg *client.Config) *cobra.Command {
	var fileId string
	cmd := &cobra.Command{
		Use:   "exec-bs <filename>",
		Short: "execute bootstrap from the supplied file",
		Long:  "execute bootstrap from the supplied file",
		RunE: func(cmd *cobra.Command, args []string) error {
			if cfg.UseEnvVars {
				if err := flag.SetFlagsFromEnv(cmd.Parent().PersistentFlags(), true, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService"); err != nil {
					return err
				}
				if err := flag.SetFlagsFromEnv(cmd.PersistentFlags(), false, cfg.EnvVarNamer, cfg.EnvVarPrefix, "FileService", "Upload"); err != nil {
					return err
				}
			}
			return client.RoundTrip(cmd.Context(), cfg, func(cc grpc.ClientConnInterface, in iocodec.Decoder, out iocodec.Encoder) error {
				b.ChangeInterceptor(cc)
				err := b.ExecuteBSCli(cmd.Context(), fileId)
				if err != nil {
					return err
				}
				return nil
			})
		},
	}
	cmd.PersistentFlags().StringVar(&fileId, "filename", "<file_id>.[json|yaml]", "file id with extension (yaml or json) ex: 1kBAJ7zRCuGNoHCW4KHxo4opyoW.json")
	return cmd
}
