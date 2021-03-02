package fakedata_test

import (
	"go.amplifyedge.org/main-v2/deploy/bootstrapper/service/go/pkg/fakedata"
	"github.com/stretchr/testify/require"
	"io/ioutil"
	"testing"
)

func TestBootstrapFakeData(t *testing.T) {
	fake, err := fakedata.BootstrapFakeData("amplify-cms.org")
	require.NoError(t, err)
	b, err := fake.MarshalPretty()
	require.NoError(t, err)

	require.NoError(t, ioutil.WriteFile("./bs-all.json", b, 0644))

	b, err = fake.MarshalYaml()
	require.NoError(t, err)

	require.NoError(t, ioutil.WriteFile("./bs-all.yaml", b, 0644))

	bmd, err := fakedata.BootstrapAllFromFilepath("./bs-all.json")
	require.NoError(t, err)

	bmd, err = fakedata.BootstrapAllFromFilepath("./bs-all.yaml")
	require.NoError(t, err)

	nsps := bmd.GetOrgs()
	require.NotEmpty(t, nsps)
}
