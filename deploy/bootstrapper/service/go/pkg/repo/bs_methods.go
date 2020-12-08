package repo

import (
	"bytes"
	"context"
	"fmt"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"

	"google.golang.org/protobuf/types/known/timestamppb"

	"github.com/getcouragenow/main/deploy/bootstrapper/service/go/pkg/fakedata"
	bsrpc "github.com/getcouragenow/main/deploy/bootstrapper/service/go/rpc/v2"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
)

const (
	maxFileSize = 8 << 20 // max upload bootstrap 8MB
	chunkSize   = 1 << 20 // chunk to 1MB

	errUpload = "cannot upload bootstrap file: %s, reason: %v"
)

func (b *BootstrapRepo) GenBSFile(extension string) (string, error) {
	bsAll, err := fakedata.BootstrapFakeData(b.domain)
	if err != nil {
		return "", err
	}
	filename := fmt.Sprintf("%s.%s", sharedConfig.NewID(), extension)
	joined := filepath.Join(b.savePath, filename)
	return b.sharedGenBS(bsAll, joined, extension)
}

func (b *BootstrapRepo) ExecuteBSCli(ctx context.Context, filename string) error {
	joined := filepath.Join(b.savePath, filename)
	bsAll, err := fakedata.BootstrapAllFromFilepath(joined)
	if err != nil {
		return err
	}
	return b.sharedExecutor(ctx, bsAll)
}

func (b *BootstrapRepo) ExecuteBootstrap(ctx context.Context, in *bsrpc.GetBSRequest) (*emptypb.Empty, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	joinedPth := filepath.Join(b.savePath, in.GetFileId())
	bsAll, err := fakedata.BootstrapAllFromFilepath(joinedPth)
	if err != nil {
		return nil, err
	}
	err = b.sharedExecutor(ctx, bsAll)
	if err != nil {
		return nil, err
	}
	return &emptypb.Empty{}, nil
}

func (b *BootstrapRepo) GetBootstrap(ctx context.Context, in *bsrpc.GetBSRequest) (*bsrpc.BS, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	joinedPth := filepath.Join(b.savePath, in.GetFileId())
	bsAll, err := fakedata.BootstrapAllFromFilepath(joinedPth)
	if err != nil {
		return nil, err
	}
	finfo, err := os.Stat(joinedPth)
	if err != nil {
		return nil, err
	}
	return &bsrpc.BS{
		FileId:    in.GetFileId(),
		CreatedAt: timestamppb.New(finfo.ModTime()),
		Content: &bsrpc.BSRequest{
			Orgs:       bsAll.GetOrgs(),
			Projects:   bsAll.GetProjects(),
			Superusers: bsAll.GetSuperUsers(),
		},
	}, nil
}

func (b *BootstrapRepo) NewBootstrap(stream bsrpc.BSService_NewBootstrapServer) error {
	in, err := stream.Recv()
	if err != nil {
		return status.Errorf(codes.InvalidArgument, errUpload, "", err)
	}
	filename := fmt.Sprintf("%s.%s", sharedConfig.NewID(), in.GetFileExtension())
	joined := filepath.Join(b.savePath, filename)
	fileBuf := bytes.Buffer{}
	fileSize := 0
	for {
		in, err = stream.Recv()
		if err != nil {
			if err == io.EOF {
				break
			}
			return status.Errorf(codes.Unknown, "cannot receive stream chunk: %v", err)
		}
		chunk := in.GetBsRequest() // as chunk
		chunkSize := len(chunk)
		fileSize += chunkSize
		if fileSize > maxFileSize {
			return status.Error(codes.Aborted, "file size exceeds maximum file size, aborting")
		}
		_, err = fileBuf.Write(chunk)
		if err != nil {
			return status.Errorf(codes.Internal, "cannot write file data to buffer: %v", err)
		}
	}
	if err = ioutil.WriteFile(joined, fileBuf.Bytes(), 0644); err != nil {
		return err
	}
	// bsAll, err := fakedata.BootstrapAllFromFilepath(joined)
	// if err != nil {
	// 	return err
	// }
	resp := &bsrpc.NewBSResponse{FileId: filename}
	if err = stream.SendAndClose(resp); err != nil {
		return status.Errorf(codes.Internal, "cannot encode upload resp: %v", err)
	}
	return nil
}

func (b *BootstrapRepo) ListBootstrap(ctx context.Context, in *bsrpc.ListBSRequest) (*bsrpc.ListBSResponse, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	// TODO: pagination
	dirContents, err := sharedConfig.ListFiles(b.savePath)
	var bses []*bsrpc.BS
	for _, f := range dirContents {
		bses = append(bses, &bsrpc.BS{
			FileId:    f.Name(),
			CreatedAt: timestamppb.New(f.ModTime()),
		})
	}
	return &bsrpc.ListBSResponse{Bootstraps: bses}, nil
}

func (b *BootstrapRepo) DeleteBootstrap(ctx context.Context, in *bsrpc.GetBSRequest) (*emptypb.Empty, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	joined := filepath.Join(b.savePath, in.GetFileId())
	err = os.RemoveAll(joined)
	if err != nil {
		return nil, err
	}
	return &emptypb.Empty{}, nil
}
