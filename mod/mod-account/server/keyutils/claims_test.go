package keyutil_test

import (
	"errors"
	"github.com/getcouragenow/main/mod/mod-account/server/keyutils"
	"github.com/square/go-jose/v3"
	"github.com/square/go-jose/v3/jwt"
	"os"
	"testing"
	"time"
)

var (
	baseKeyPath    = "./test-keys"
	rsaSigner      jose.Signer
	ed25519Signer  jose.Signer
	generatedToken string
)

func TestAppClaims(t *testing.T) {
	os.Setenv("JWT_PRIVATE_KEY", `{"use":"sig","kty":"OKP","kid":"Q3Cra4Yd1lHAD_prGo9SKbFw9Rj5Fogi8V-0vqDymLQ=","crv":"Ed25519","alg":"EdDSA","x":"f-k4X1h1gNR7uKiVf8fWAXGMgwnAfbJKUteVJj2J9Wc","d":"pVpwGCsKQH8zMNAygbVK60_Ms2LjSNglbpLU2D2I25U"}`)
	t.Run("Test Reading Key", testReadingKey)
	// t.Run("Test Generate JWT", testGenerateJwt)
	t.Run("Test Validate JWT", testValidateJwt)
}

func testReadingKey(t *testing.T) {
	t.Log("\tShould be able to read keys on valid key")
	{

		t.Log("\tOn ECC signing key (Ed25519)")
		{
			algo := keyutil.ECC
			res, err := algo.ReadSignerKey()
			if err != nil {
				t.Fatalf("\t%s\tShould be able to read ECC key: %v", failed, err)
			}
			ed25519Signer = res
			t.Logf("\t%s\tShould be able to read ECC key", success)
		}
	}
}

// func testGenerateJwt(t *testing.T) {
// 	claim := keyutil.NewAppClaims("test", "anon",
// 		"test.local",
// 		[]string{"getcourage", "test"},
// 		time.Duration(1)*time.Minute,
// 	)
// 	t.Log("\tShould be able to generate jwt token given a signer key")
// 	{
// 		t.Log("\tGiven Ed25519 signer key")
// 		{
// 			token, err := claim.CreateJwtClaims(ed25519Signer)
// 			if err != nil {
// 				t.Fatalf("\t%s\tShould be able to generate jwt given Ed25519 key: %v",
// 					failed, err)
// 			}
// 			generatedToken = token
// 			t.Logf("\t%s\tShould be able to generate jwt given Ed25519 key: %s",
// 				success, token)
// 		}
// 	}
// }

func testValidateJwt(t *testing.T) {
	validator := func(claim *keyutil.AppClaims) (bool, error) {
		if claim.Issuer != "test.local" {
			return false, errors.New("issuer is not valid")
		}
		if *claim.Expiry <= *jwt.NewNumericDate(time.Now()) {
			return false, errors.New("token is expired")
		}
		return true, nil
	}
	t.Log("\tShould be able to validate generated jwt token")
	{
		ok, err := keyutil.VerifyJwt(generatedToken, validator)
		if err != nil {
			t.Fatalf("\t%s\tShould be able to validate generated jwt token: %v",
				failed, err)
		}
		if !ok {
			t.Fatalf("\t%s\tShould be able to validate generated jwt token",
				failed)
		}
		t.Logf("\t%s\tShould be able to validate generated jwt token",
			success)
	}
}
