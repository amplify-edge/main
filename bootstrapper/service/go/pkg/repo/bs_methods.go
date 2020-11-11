package repo

import (
	"context"
	"fmt"
	"io/ioutil"
	"path/filepath"
	"time"

	accountPkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	accountRepo "github.com/getcouragenow/sys/sys-account/service/go/pkg/repo"

	"github.com/getcouragenow/main/bootstrapper/service/go/pkg/fakedata"
)

func (b *BootstrapRepo) GenBSFile(extension string) (string, error) {
	bsAll, err := fakedata.BootstrapFakeData(b.domain)
	if err != nil {
		return "", err
	}
	filename := fmt.Sprintf("%s.%s", sharedConfig.NewID(), extension)
	joined := filepath.Join(b.savePath, filename)
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

func (b *BootstrapRepo) ExecuteBSCli(filename string) error {
	bsAll, err := fakedata.BootstrapAllFromFilepath(filename)
	if err != nil {
		return err
	}
	supers := bsAll.GetSuperUsers()
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
	orgs := bsAll.GetOrgs()
	for _, org := range orgs {
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		if _, err = b.accRepo.NewOrg(newCtx, accountPkg.OrgRequestFromProto(org.GetOrg())); err != nil {
			cancel()
			return err
		}
	}
	projects := bsAll.GetProjects()
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
