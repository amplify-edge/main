package filters

import (
	"errors"
	envoy_core "github.com/envoyproxy/go-control-plane/envoy/api/v2/core"
	envoy_auth "github.com/envoyproxy/go-control-plane/envoy/service/auth/v2"
	envoy_type "github.com/envoyproxy/go-control-plane/envoy/type"
	keyutils "github.com/getcouragenow/main/mod/mod-account/server/keyutils"
	"github.com/gogo/googleapis/google/rpc"
	"github.com/square/go-jose/v3/jwt"
	rpcstatus "google.golang.org/genproto/googleapis/rpc/status"
	"os"
	"time"
)

func tokenValidatorFunc(claim *keyutils.AppClaims) (bool, error) {
	//  TODO: validates more than this, i.e. audience & RBAC stuff
	if claim.Issuer != os.Getenv("DEV_ISSUER") {
		return false, errors.New("issuer is not valid")
	}
	if *claim.Expiry <= *jwt.NewNumericDate(time.Now()) {
		return false, errors.New("token is expired")
	}
	return true, nil
}

func FilterJWT(token string) (bool, error) {
	return keyutils.VerifyJwt(token, tokenValidatorFunc)
}

func GetClaim(token string) (*string, error) {
	cl, err := keyutils.GetClaimsFromToken(token)
	if err != nil {
		return nil, err
	}
	return &cl.UserID, nil
}

// TODO: use denied response, as this is currently unused.
func DeniedResponse(envoystatus envoy_type.StatusCode, rpcstatusCode rpc.Code, msg string) *envoy_auth.CheckResponse {
	return &envoy_auth.CheckResponse{
		Status: &rpcstatus.Status{
			Code:    int32(rpcstatusCode),
			Message: msg,
		},
		HttpResponse: &envoy_auth.CheckResponse_DeniedResponse{
			DeniedResponse: &envoy_auth.DeniedHttpResponse{
				Status: &envoy_type.HttpStatus{
					Code: envoystatus,
				},
				Headers: nil,
				Body:    msg,
			},
		},
	}
}

func OKResponse(headers []*envoy_core.HeaderValueOption) *envoy_auth.CheckResponse {
	return &envoy_auth.CheckResponse{
		Status: &rpcstatus.Status{
			Code: int32(rpc.OK),
		},
		HttpResponse: &envoy_auth.CheckResponse_OkResponse{
			OkResponse: &envoy_auth.OkHttpResponse{
				Headers: headers,
			},
		},
	}
}

// Adds Authorized user to header value
func GenAuthdUser(uid, token string) []*envoy_core.HeaderValueOption {
	return []*envoy_core.HeaderValueOption{
		{
			Header: &envoy_core.HeaderValue{
				Key:   keyutils.HEADER_CLIENT_NAME,
				Value: "authorized",
			},
		},
		{
			Header: &envoy_core.HeaderValue{
				Key:   keyutils.HEADER_IS_LOGGED_IN,
				Value: "1",
			},
		},
		{
			Header: &envoy_core.HeaderValue{
				Key:   keyutils.HEADER_USER_ID,
				Value: uid,
			},
		},
		{
			// Passes original token
			Header: &envoy_core.HeaderValue{
				Key:   keyutils.ORIGINAL_TOKEN,
				Value: token,
			},
		},
	}
}

// Adds Guest user to header value if not logged in
func GenGuestUser() []*envoy_core.HeaderValueOption {
	return []*envoy_core.HeaderValueOption{
		{
			Header: &envoy_core.HeaderValue{
				Key:   keyutils.HEADER_CLIENT_NAME,
				Value: "guest",
			},
		},
		{
			Header: &envoy_core.HeaderValue{
				Key:   keyutils.HEADER_USER_ID,
				Value: "",
			},
		},
		{
			Header: &envoy_core.HeaderValue{
				Key:   keyutils.HEADER_IS_LOGGED_IN,
				Value: "0",
			},
		},
	}
}
