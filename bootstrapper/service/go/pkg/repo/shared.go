package repo

import (
	"context"
	"fmt"
	bsrpc "github.com/getcouragenow/main/bootstrapper/service/go/rpc/v2"
	"io/ioutil"
	"time"

	"github.com/getcouragenow/main/bootstrapper/service/go/pkg/fakedata"
	accountPkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	accountRepo "github.com/getcouragenow/sys/sys-account/service/go/pkg/repo"
)

func (b *BootstrapRepo) sharedExecutor(bsAll *fakedata.BootstrapAll) (err error) {
	supers := bsAll.GetSuperUsers()
	orgs := bsAll.GetOrgs()
	projects := bsAll.GetProjects()
	if b.accClient != nil && b.discoClient != nil {
		return b.sharedExecv3(supers, orgs, projects)
	}
	return b.sharedExecv2(supers, orgs, projects)
}

func (b *BootstrapRepo) sharedExecv3(supers []*bsrpc.BSAccount, orgs []*bsrpc.BSOrg, projects []*bsrpc.BSProject) error {
	var err error
	for _, supe := range supers {
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
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
			AvatarFilepath: "./testdata/avatar.png",
		}
		if _, err = b.accClient.NewAccount(newCtx, supeRequest); err != nil {
			cancel()
			return err
		}
	}
	for _, org := range orgs {
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		if _, err = b.accClient.NewOrg(newCtx, accountPkg.OrgRequestFromProto(org.GetOrg())); err != nil {
			cancel()
			return err
		}
	}
	for _, proj := range projects {
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
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
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		if supe.GetSurveyValue() != nil {
			if _, err = b.discoClient.NewSurveyUser(newCtx, supe.GetSurveyValue()); err != nil {
				cancel()
				return err
			}
		}
	}
	return nil
}

func (b *BootstrapRepo) sharedExecv2(supers []*bsrpc.BSAccount, orgs []*bsrpc.BSOrg, projects []*bsrpc.BSProject) error {
	var err error
	for _, supe := range supers {
		superReq := &accountRepo.SuperAccountRequest{
			Email:          supe.InitialSuperuser.GetEmail(),
			Password:       supe.GetInitialSuperuser().GetPassword(),
			AvatarFilePath: "./testdata/default_root_avatar.png",
		}
		if err = b.accRepo.InitSuperUser(superReq); err != nil {
			return err
		}
	}
	for _, org := range orgs {
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		if _, err = b.accRepo.NewOrg(newCtx, accountPkg.OrgRequestFromProto(org.GetOrg())); err != nil {
			cancel()
			return err
		}
	}
	for _, proj := range projects {
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
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
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
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
