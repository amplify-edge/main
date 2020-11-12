package repo

import (
	"github.com/getcouragenow/protoc-gen-cobra/client"
	"github.com/getcouragenow/protoc-gen-cobra/flag"
	"github.com/getcouragenow/protoc-gen-cobra/iocodec"
	"github.com/spf13/cobra"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/timestamppb"
	"os"
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
