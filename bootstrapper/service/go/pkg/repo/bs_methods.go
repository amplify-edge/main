package repo

import (
	"context"
	"fmt"
	accountPkg "github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	accountRepo "github.com/getcouragenow/sys/sys-account/service/go/pkg/repo"
	"io/ioutil"
	"path/filepath"
	"time"

	"github.com/getcouragenow/main/bootstrapper/service/go/pkg/fakedata"
)

func (b *BootstrapRepo) GenBSFile(filename string) error {
	bsAll, err := fakedata.BootstrapFakeData(b.domain)
	if err != nil {
		return err
	}
	ext := filepath.Ext(filename)
	joined := filepath.Join(b.savePath, filename)
	switch ext {
	case ".json":
		jbytes, err := bsAll.MarshalPretty()
		if err != nil {
			return err
		}
		return ioutil.WriteFile(joined, jbytes, 0644)
	case ".yml", ".yaml":
		ybytes, err := bsAll.MarshalYaml()
		if err != nil {
			return err
		}
		return ioutil.WriteFile(joined, ybytes, 0644)
	default:
		return fmt.Errorf("invalid filename extension: %s for filename: %s", ext, filename)
	}
}

func (b *BootstrapRepo) ExecuteBSCli(id string) error {
	bsAll, err := fakedata.BootstrapAllFromFilepath(id)
	if err != nil {
		return err
	}
	supers := bsAll.GetSuperUsers()
	for _, supe := range supers {
		if err = b.accRepo.InitSuperUser(&accountRepo.SuperAccountRequest{
			Email:    supe.InitialSuperuser.GetEmail(),
			Password: supe.GetInitialSuperuser().GetPassword(),
		}); err != nil {
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
		if _, err = b.discoRepo.NewSurveyProject(newCtx, proj.GetSurveySchema()); err != nil {
			return err
		}
	}
	for _, supe := range supers {
		newCtx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		if _, err = b.discoRepo.NewSurveyUser(newCtx, supe.GetSurveyValue()); err != nil {
			cancel()
			return err
		}
	}
	return nil
}
