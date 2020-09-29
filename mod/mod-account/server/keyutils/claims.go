package keyutil

import (
	"errors"
	"github.com/square/go-jose/v3"
	"github.com/square/go-jose/v3/jwt"
	"os"
	"time"
)

type (
	// Wrapper for jose.Signer
	Signer jose.Signer
	// Claims
	AppClaims struct {
		ClientID string `json:"cid"`
		UserID   string `json:"uid"`
		Role string `json:"role"`
		jwt.Claims
	}
)

const (
	HEADER_CLIENT_NAME = "x-client-role"
	HEADER_USER_ID = "x-user-id"
	HEADER_IS_LOGGED_IN = "x-client-is-logged-in"
	ORIGINAL_TOKEN = "x-jwt-token"
)


func (k *KeyType) ReadSignerKey() (jose.Signer, error) {
	return k.readPrivateSigner()
}

// readPrivateSigner read private signing key from disk
// returning signing key
func (k *KeyType) readPrivateSigner() (jose.Signer, error) {
	key := []byte(os.Getenv("JWT_PRIVATE_KEY"))
	// create new empty private key & unmarshal it
	privKey := jose.JSONWebKey{}
	if err := privKey.UnmarshalJSON(key); err != nil {
		return nil, err
	}
	var algo jose.SignatureAlgorithm
	switch *k {
	case RSA:
		algo = jose.RS384
	case ECC:
		algo = jose.EdDSA
	default:
		algo = jose.RS256
	}
	return jose.NewSigner(jose.SigningKey{
		Algorithm: algo,
		Key:       privKey.Key,
	}, (&jose.SignerOptions{}).WithType("JWT"))
}

// NewAppClaims creates new app claims
func NewAppClaims(cid, uid, iss, role string, aud []string, dur time.Duration) *AppClaims {
	currentTime := jwt.NewNumericDate(time.Now())
	expiry := jwt.NewNumericDate(currentTime.Time().Add(dur))
	return &AppClaims{
		cid,
		uid,
		role,
		jwt.Claims{
			Issuer:    iss,
			Audience:  aud,
			NotBefore: currentTime,
			IssuedAt:  currentTime,
			Expiry:    expiry,
		},
	}
}

// CreateJwtClaims creates jwt claims with specified Issuer, Audience, and Duration
func (a *AppClaims) CreateJwtClaims(signer Signer) (string, error) {
	return jwt.Signed(signer).Claims(*a).CompactSerialize()
}

// VerifyJwt parses and verifies token
func VerifyJwt(rawToken string, validator func(*AppClaims) (bool, error)) (bool, error) {
	claim, err := GetClaimsFromToken(rawToken)
	if err != nil {
		return false, err
	}
	if ok, err := validator(claim); !ok {
		return false, errors.New("token is not valid")
	} else if err != nil {
		return false, err
	}
	return true, nil
}

// GetClaimsFromToken gets AppClaims from token
func GetClaimsFromToken(rawToken string) (*AppClaims, error) {
	token, err := jwt.ParseSigned(rawToken)
	if err != nil {
		return nil, err
	}
	claim := AppClaims{}
	if err = token.UnsafeClaimsWithoutVerification(&claim); err != nil {
		return nil, err
	}
	return &claim, nil
}
