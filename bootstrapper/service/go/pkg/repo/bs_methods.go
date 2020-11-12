package repo

import (
	"context"
	"fmt"
	"google.golang.org/protobuf/types/known/emptypb"
	"os"
	"path/filepath"

	"google.golang.org/protobuf/types/known/timestamppb"

	"github.com/getcouragenow/main/bootstrapper/service/go/pkg/fakedata"
	bsrpc "github.com/getcouragenow/main/bootstrapper/service/go/rpc/v2"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
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

func (b *BootstrapRepo) ExecuteBS(ctx context.Context, in *bsrpc.GetBSRequest) (*emptypb.Empty, error) {
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

func (b *BootstrapRepo) GetBS(ctx context.Context, in *bsrpc.GetBSRequest) (*bsrpc.BS, error) {
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

func (b *BootstrapRepo) NewBootstrap(ctx context.Context, in *bsrpc.NewBSRequest) (*bsrpc.NewBSResponse, error) {
	_, err := b.AuthOverride(ctx)
	if err != nil {
		return nil, err
	}
	filename := fmt.Sprintf("%s.%s", sharedConfig.NewID(), in.GetFileExtension())
	joined := filepath.Join(b.savePath, filename)
	var bsAll *fakedata.BootstrapAll
	if in.GetBsRequest() != nil {
		bsAll = fakedata.BootstrapFromBSRequest(in.GetBsRequest())
	} else {
		bsAll, err = fakedata.BootstrapFakeData(b.domain)
		if err != nil {
			return nil, err
		}
	}
	fileId, err := b.sharedGenBS(bsAll, joined, in.GetFileExtension())
	if err != nil {
		return nil, err
	}
	return &bsrpc.NewBSResponse{FileId: fileId}, nil
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
