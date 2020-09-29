package auth

import (
	"context"
	"fmt"
	"github.com/getcouragenow/main/mod/mod-account/server/authn/pkg/pass"
	"github.com/getcouragenow/main/mod/mod-account/server/authn/pkg/store"
	"github.com/getcouragenow/main/mod/mod-account/server/authn/pkg/utilities"
	kutil "github.com/getcouragenow/main/mod/mod-account/server/keyutils"
	"github.com/grpc-ecosystem/go-grpc-middleware/util/metautils"
	"time"
)

var (
	ContextKeyClaims = ContextKey("auth-claims")
)

type (
	ContextKey string
	AuthnRepo struct {
		signingKey kutil.Signer
		store store.Storer
	}
)

func (c ContextKey) String() string {
	return "authn.grpc context key " + string(c)
}

func NewAuthnRepo(signingKey kutil.Signer, datastore store.Storer) *AuthnRepo {
	return &AuthnRepo{signingKey, datastore}
}

// NewClaim takes ClientID, UserID, Issuer, Audience (scopes), and Duration for expiry
func (a *AuthnRepo) NewClaim(cid, uid, iss, role string, aud []string, dur time.Duration) (string, error) {
	appclaim := kutil.NewAppClaims(cid, uid, iss, role, aud, dur)
	return appclaim.CreateJwtClaims(a.signingKey)
}

// VerifyGetUser Verifies user and password, then move on
func (a *AuthnRepo) VerifyGetUser(id string) (*store.User, error) {
	if id != "" {
		return a.store.GetUserByID(id)
	}
	return newGuestUser()
}

func newGuestUser() (*store.User, error) {
	uid := utilities.NewID()
	randmail := fmt.Sprintf("%s@example.com", uid)
	h, s, err := pass.Hash("")
	if err != nil {
		return nil, err
	}
	newuser := store.NewUser(uid, "guest", randmail, h, s)
	return newuser, nil
}

func ObtainClaimsFromMetadata(ctx context.Context) (claims *kutil.AppClaims, err error) {
	var authmeta string
	if authmeta, err = tokenFromMetadata(ctx); err != nil {
		return nil, err
	}
	if claims, err = kutil.GetClaimsFromToken(authmeta); err != nil {
		return nil, err
	}
	return claims, nil
}

func ObtainClaimsFromContext(ctx context.Context) *kutil.AppClaims {
	claims, ok := ctx.Value(ContextKeyClaims).(*kutil.AppClaims)
	if !ok {
		return nil
	}
	return claims
}

func tokenFromMetadata(ctx context.Context) (string, error) {
	authMeta := metautils.ExtractIncoming(ctx).Get(kutil.ORIGINAL_TOKEN)
	if authMeta == "" {
		return "", AuthError{Reason: ErrMissingToken}
	}
	return authMeta, nil
}
