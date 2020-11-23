package repo

import (
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	sharedAuth "github.com/getcouragenow/sys-share/sys-account/service/go/pkg/shared"
)

func (b *BootstrapRepo) AuthOverride(ctx context.Context) (context.Context, error) {
	claims := sharedAuth.ObtainClaimsFromContext(ctx)
	if !sharedAuth.IsSuperadmin(claims.Role) {
		return ctx, status.Errorf(codes.PermissionDenied, "Permission denied: user is not a superuser")
	}
	return context.WithValue(ctx, sharedAuth.ContextKeyClaims, claims), nil
}
