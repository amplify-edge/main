package utilities

import (
	"errors"
	pb "github.com/getcouragenow/main/mod/mod-account/server/authn/pkg/api"
	"github.com/getcouragenow/main/mod/mod-account/server/authn/pkg/auth"
	"strings"
)

type RoleWrapper pb.UserRoles

var (
	invalidRole = &auth.AuthError{
		Reason: auth.ErrInvalidCredentials,
		Err:    errors.New("invalid role specified"),
	}
)

func (rw *RoleWrapper) String() (string, error) {
	switch pb.UserRoles(*rw) {
	case pb.UserRoles_GUEST:
		return "guest", nil
	case pb.UserRoles_USER:
		return "user", nil
	case pb.UserRoles_SPECIAL_MEMBER:
		return "special_member", nil
	case pb.UserRoles_ADMIN:
		return "admin", nil
	default:
		return "invalid", invalidRole
	}
}

// RoleFromString translates string to pb.UserRoles
func RoleFromString(str string) (pb.UserRoles, *auth.AuthError) {
	switch str {
	case "guest":
		return pb.UserRoles_GUEST, nil
	case "user":
		return pb.UserRoles_USER, nil
	case "special_member":
		return pb.UserRoles_SPECIAL_MEMBER, nil
	case "admin":
		return pb.UserRoles_ADMIN, nil
	default:
		return pb.UserRoles_INVALID, invalidRole
	}
}

// RoleToString translates pb.UserrRoles to string
func RoleToString(role *pb.UserRoles) (string, error) {
	rw := (*RoleWrapper)(role)
	r, err := rw.String()
	if err != nil {
		return r, err
	}
	return strings.Trim(r, "\n \t"), nil
}
