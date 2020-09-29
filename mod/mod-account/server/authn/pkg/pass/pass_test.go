package pass_test

import (
	"github.com/getcouragenow/main/mod/mod-account/server/authn/pkg/pass"
	"testing"
)

type hashAndSalt struct {
	Unhashed string
	Hash     string
	Salt     string
}

const (
	success = "\u2713"
	failed  = "\u274c"
)

func TestPass(t *testing.T) {
	t.Run("Test password generation & verification", testPass)
}

func testPass(t *testing.T) {
	t.Log("Given the need to produce hash and salt from plain text password, and verifies it thus.")
	{
		hs := hashAndSalt{
			Unhashed: "gogetsomecouragenow",
		}
		t.Log("\tHandling hashing and updating hash and salt record.")
		{
			h, s, err := pass.Hash(hs.Unhashed)
			if err != nil {
				t.Fatalf("\tShould be able to create hash and salt from plain text password: %s", err)
			}
			t.Logf("Successfully created hash: %s\t and salt:%s\t from plain text password: %s\n", h, s, hs.Unhashed)
			hs.Hash = h
			hs.Salt = s
		}
		t.Log("\tHandling verification of hash and salt")
		{
			valid := pass.VerifyHash(hs.Unhashed, hs.Hash, hs.Salt)
			if !valid {
				t.Fatalf("\tShould get valid status when password is verified, instead got: %t", valid)
			}
			t.Log("Successfully verified password.")

			if valid = pass.VerifyHash("gogodance", hs.Hash, hs.Salt); valid {
				t.Fatalf("\tShould get invalid status when password is unmatched, instead got: %t", valid)
			}
			t.Log("Successfully invalidates invalid password.")
		}
	}
}
