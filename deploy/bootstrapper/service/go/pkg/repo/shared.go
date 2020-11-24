package repo

import (
	"context"
	"fmt"
	"github.com/getcouragenow/sys-share/sys-core/service/fakehelper"
	"io/ioutil"
	"time"

	"github.com/getcouragenow/main/deploy/bootstrapper/service/go/pkg/fakedata"
	bsrpc "github.com/getcouragenow/main/deploy/bootstrapper/service/go/rpc/v2"
	accountPkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	accountRepo "github.com/getcouragenow/sys/sys-account/service/go/pkg/repo"
)

func (b *BootstrapRepo) sharedExecutor(ctx context.Context, bsAll *fakedata.BootstrapAll) (err error) {
	supers := bsAll.GetSuperUsers()
	orgs := bsAll.GetOrgs()
	projects := bsAll.GetProjects()
	if b.accRepo != nil && b.discoRepo != nil {
		return b.sharedExecv2(ctx, supers, orgs, projects)
	}
	if b.accClient != nil && b.discoClient != nil {
		return b.sharedExecv3(ctx, supers, orgs, projects)
	}
	return fmt.Errorf("invalid argument, no repo or client defined for bootstrap")
}

func (b *BootstrapRepo) sharedExecv3(ctx context.Context, supers []*bsrpc.BSAccount, orgs []*bsrpc.BSOrg, projects []*bsrpc.BSProject) error {
	var err error
	for _, supe := range supers {
		newCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
		supeRequest := &accountPkg.AccountNewRequest{
			Email:    supe.GetInitialSuperuser().GetEmail(),
			Password: supe.GetInitialSuperuser().GetPassword(),
			Roles: []*accountPkg.UserRoles{
				{
					Role:      accountPkg.SUPERADMIN,
					OrgID:     "",
					ProjectID: "",
					All:       true,
				},
			},
		}
		avatar, err := fakehelper.GenFakeLogo("./bootstrap-data/client/generated", 128)
		if err != nil {
			return err
		}
		supeRequest.AvatarFilepath = avatar
		if _, err = b.accClient.NewAccount(newCtx, supeRequest); err != nil {
			cancel()
			return err
		}
	}
	for _, org := range orgs {
		newCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
		if _, err = b.accClient.NewOrg(newCtx, accountPkg.OrgRequestFromProto(org.GetOrg())); err != nil {
			cancel()
			return err
		}
	}
	for _, proj := range projects {
		newCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
		if _, err = b.accClient.NewProject(newCtx, accountPkg.ProjectRequestFromProto(proj.GetProject())); err != nil {
			cancel()
			return err
		}
		if _, err = b.discoClient.NewDiscoProject(newCtx, proj.GetProjectDetails()); err != nil {
			return err
		}
		if proj.GetSurveySchema() != nil {
			if _, err = b.discoClient.NewSurveyProject(newCtx, proj.GetSurveySchema()); err != nil {
				return err
			}
		}
	}
	for _, supe := range supers {
		newCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
		if supe.GetSurveyValue() != nil {
			if _, err = b.discoClient.NewSurveyUser(newCtx, supe.GetSurveyValue()); err != nil {
				cancel()
				return err
			}
		}
	}
	return nil
}

func (b *BootstrapRepo) sharedExecv2(ctx context.Context, supers []*bsrpc.BSAccount, orgs []*bsrpc.BSOrg, projects []*bsrpc.BSProject) error {
	var err error
	for _, supe := range supers {
		superReq := &accountRepo.SuperAccountRequest{
			Email:          supe.InitialSuperuser.GetEmail(),
			Password:       supe.GetInitialSuperuser().GetPassword(),
			AvatarFilePath: "./bootstrap-data/default/default_root_avatar.png",
		}

		avatar, err := fakehelper.GenFakeLogo("./bootstrap-data/client/generated", 128)
		if err != nil {
			return err
		}
		superReq.AvatarFilePath = avatar
		if err = b.accRepo.InitSuperUser(superReq); err != nil {
			return err
		}
	}
	for _, org := range orgs {
		newCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
		if _, err = b.accRepo.NewOrg(newCtx, accountPkg.OrgRequestFromProto(org.GetOrg())); err != nil {
			cancel()
			return err
		}
	}
	for _, proj := range projects {
		newCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
		if _, err = b.accRepo.NewProject(newCtx, accountPkg.ProjectRequestFromProto(proj.GetProject())); err != nil {
			cancel()
			return err
		}
		if _, err = b.discoRepo.NewDiscoProject(newCtx, proj.GetProjectDetails()); err != nil {
			return err
		}
		if proj.GetSurveySchema() != nil {
			if _, err = b.discoRepo.NewSurveyProject(newCtx, proj.GetSurveySchema()); err != nil {
				return err
			}
		}
	}
	for _, supe := range supers {
		newCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
		if supe.GetSurveyValue() != nil {
			if _, err = b.discoRepo.NewSurveyUser(newCtx, supe.GetSurveyValue()); err != nil {
				cancel()
				return err
			}
		}
	}
	return nil
}

func (b *BootstrapRepo) sharedGenBS(bsAll *fakedata.BootstrapAll, joined, extension string) (string, error) {
	switch extension {
	case "json":
		jbytes, err := bsAll.MarshalPretty()
		if err != nil {
			return "", err
		}
		return joined, ioutil.WriteFile(joined, jbytes, 0644)
	case "yml", "yaml":
		ybytes, err := bsAll.MarshalYaml()
		if err != nil {
			return "", err
		}
		return joined, ioutil.WriteFile(joined, ybytes, 0644)
	default:
		return "", fmt.Errorf("invalid filename extension: %s", extension)
	}
}
