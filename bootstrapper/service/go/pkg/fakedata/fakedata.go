package fakedata

import (
	bsrpc "github.com/getcouragenow/main/bootstrapper/service/go/rpc/v2"
	discoFake "github.com/getcouragenow/mod/mod-disco/service/go/pkg/fakedata"
	accFake "github.com/getcouragenow/sys-share/sys-account/service/go/pkg/fakedata"
	sharedConfig "github.com/getcouragenow/sys-share/sys-core/service/config"
	"github.com/getcouragenow/sys-share/sys-core/service/fakehelper"
)

type bootstrapBsProjects struct {
	BSProjects []*bsrpc.BSProject `json:"main_bootstrap_projects" yaml:"main_bootstrap_projects"`
}

type bootstrapBSOrgs struct {
	BSOrgs []*bsrpc.BSOrg `json:"main_bootstrap_orgs" yaml:"main_bootstrap_orgs"`
}

type bootstrapBSAccounts struct {
	BSAccounts []*bsrpc.BSAccount `json:"main_bootstrap_superusers" yaml:"main_bootstrap_superusers"`
}

type BootstrapAll struct {
	Orgs       bootstrapBSOrgs     `json:"orgs" yaml:"orgs"`
	Projects   bootstrapBsProjects `json:"projects" yaml:"projects"`
	Superusers bootstrapBSAccounts `json:"superusers" yaml:"superusers"`
}

func (b *BootstrapAll) GetOrgs() []*bsrpc.BSOrg {
	return b.Orgs.BSOrgs
}

func (b *BootstrapAll) GetSuperUsers() []*bsrpc.BSAccount {
	return b.Superusers.BSAccounts
}

func (b *BootstrapAll) GetProjects() []*bsrpc.BSProject {
	return b.Projects.BSProjects
}

func (b *BootstrapAll) MarshalPretty() ([]byte, error) {
	return sharedConfig.MarshalPretty(b)
}

func (b *BootstrapAll) MarshalYaml() ([]byte, error) {
	return sharedConfig.MarshalYAML(b)
}

func BootstrapFromBSRequest(in *bsrpc.BSRequest) *BootstrapAll {
	return &BootstrapAll{
		Orgs:       bootstrapBSOrgs{in.GetOrgs()},
		Projects:   bootstrapBsProjects{in.GetProjects()},
		Superusers: bootstrapBSAccounts{in.GetSuperusers()},
	}
}

func BootstrapFakeData(domain string) (*BootstrapAll, error) {
	sysAccRc, sysOrgRc, sysProjRc, accFakeData, err := accFake.BootstrapFakeData(domain)
	if err != nil {
		return nil, err
	}
	discoFakeData, err := discoFake.BootstrapFakeData(domain, sysAccRc, sysOrgRc, sysProjRc)
	if err != nil {
		return nil, err
	}
	supers := accFakeData.GetSuperUsers()
	surveyUsers := discoFakeData.GetSurveyUsers()
	var bsAccounts []*bsrpc.BSAccount
	for i := 0; i < len(supers); i++ {
		bsAccount := &bsrpc.BSAccount{
			InitialSuperuser: supers[i],
		}
		email := supers[i].GetEmail()
		for _, su := range surveyUsers {
			if su.SysAccountUserRefName == email {
				bsAccount.SurveyValue = su
			}
		}
		bsAccounts = append(bsAccounts, bsAccount)
	}
	var bsOrgs []*bsrpc.BSOrg
	for _, org := range accFakeData.GetOrgs() {
		bsOrgs = append(bsOrgs, &bsrpc.BSOrg{Org: org})
	}
	var bsProjects []*bsrpc.BSProject
	sysProjects := accFakeData.GetProjects()
	for i := 0; i < len(sysProjects); i++ {
		bsProject := &bsrpc.BSProject{
			Project: sysProjects[i],
		}
		projName := sysProjects[i].GetName()
		for _, dp := range discoFakeData.GetDiscoProjects() {
			if dp.GetSysAccountProjectRefName() == projName {
				bsProject.ProjectDetails = dp
			}
		}
		for _, sp := range discoFakeData.GetSurveyProjects() {
			if sp.GetSysAccountProjectRefName() == projName {
				bsProject.SurveySchema = sp
			}
		}
		bsProjects = append(bsProjects, bsProject)
	}
	return &BootstrapAll{
		Orgs:       bootstrapBSOrgs{bsOrgs},
		Projects:   bootstrapBsProjects{bsProjects},
		Superusers: bootstrapBSAccounts{bsAccounts},
	}, nil
}

func BootstrapAllFromFilepath(path string) (*BootstrapAll, error) {
	var bsAll BootstrapAll
	if err := fakehelper.UnmarshalFromFilepath(path, &bsAll); err != nil {
		return nil, err
	}
	return &bsAll, nil
}
