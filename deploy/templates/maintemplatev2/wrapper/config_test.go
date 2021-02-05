package wrapper_test

import (
	"github.com/amplify-cms/main/deploy/templates/maintemplatev2/wrapper"
	"github.com/stretchr/testify/require"
	"testing"
)

func TestWrapper(t *testing.T) {
	t.Run("testConfigParse", testConfigParse)
}

func testConfigParse(t *testing.T) {
	// test parse server config
	_, err := wrapper.NewServerConfig("./testdata/config-server.yml")
	require.NoError(t, err)

	// test parse client config
	_, err = wrapper.NewClientConfig("./testdata/config-client.yml")
	require.NoError(t, err)
}
