package keyutil_test

import (
	"github.com/getcouragenow/main/mod/mod-account/server/keyutils"
	"os"
	"testing"
)

const (
	success = "\u2713"
	failed  = "\u274c"
)

func TestJwtKeys(t *testing.T) {
	t.Run("Test Generating Keys", testGenKey)
}

func testGenKey(t *testing.T) {
	t.Log("\tShould generate key for RSA")
	{
		var r keyutil.KeyType = keyutil.RSA
		err := r.GenSigningKeys("./")
		if err != nil {
			t.Fatalf("\t%s\tShould be able to generate RSA keys: %v", failed, err)
		}
		removeGeneratedKeys("./")
		t.Logf("\t%s\tShould be able to generate RSA keys", success)
	}
	t.Log("\tShould generate key for ECC/Ed25519")
	{
		var e keyutil.KeyType = keyutil.ECC
		err := e.GenSigningKeys("./")
		if err != nil {
			t.Fatalf("\t%s\tShould be able to generate Ed25519 keys: %v", failed, err)
		}
		removeGeneratedKeys("./")
		t.Logf("\t%s\tShould be able to generate Ed25519 keys", success)
	}
}

func removeGeneratedKeys(path string) {
	os.Remove(path + "/jwk-sig-private.json")
	os.Remove(path + "/jwk-sig-public.json")
}
