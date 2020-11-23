// Code generated by protoc-gen-go-grpc. DO NOT EDIT.

package v2

import (
	context "context"
	empty "github.com/golang/protobuf/ptypes/empty"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion7

// BSServiceClient is the client API for BSService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type BSServiceClient interface {
	// hide
	NewBootstrap(ctx context.Context, opts ...grpc.CallOption) (BSService_NewBootstrapClient, error)
	GetBootstrap(ctx context.Context, in *GetBSRequest, opts ...grpc.CallOption) (*BS, error)
	ListBootstrap(ctx context.Context, in *ListBSRequest, opts ...grpc.CallOption) (*ListBSResponse, error)
	ExecuteBootstrap(ctx context.Context, in *GetBSRequest, opts ...grpc.CallOption) (*empty.Empty, error)
	DeleteBootstrap(ctx context.Context, in *GetBSRequest, opts ...grpc.CallOption) (*empty.Empty, error)
}

type bSServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewBSServiceClient(cc grpc.ClientConnInterface) BSServiceClient {
	return &bSServiceClient{cc}
}

var bSServiceNewBootstrapStreamDesc = &grpc.StreamDesc{
	StreamName:    "NewBootstrap",
	ClientStreams: true,
}

func (c *bSServiceClient) NewBootstrap(ctx context.Context, opts ...grpc.CallOption) (BSService_NewBootstrapClient, error) {
	stream, err := c.cc.NewStream(ctx, bSServiceNewBootstrapStreamDesc, "/v2.main_bootstrap.services.BSService/NewBootstrap", opts...)
	if err != nil {
		return nil, err
	}
	x := &bSServiceNewBootstrapClient{stream}
	return x, nil
}

type BSService_NewBootstrapClient interface {
	Send(*NewBSRequest) error
	CloseAndRecv() (*NewBSResponse, error)
	grpc.ClientStream
}

type bSServiceNewBootstrapClient struct {
	grpc.ClientStream
}

func (x *bSServiceNewBootstrapClient) Send(m *NewBSRequest) error {
	return x.ClientStream.SendMsg(m)
}

func (x *bSServiceNewBootstrapClient) CloseAndRecv() (*NewBSResponse, error) {
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	m := new(NewBSResponse)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

var bSServiceGetBootstrapStreamDesc = &grpc.StreamDesc{
	StreamName: "GetBootstrap",
}

func (c *bSServiceClient) GetBootstrap(ctx context.Context, in *GetBSRequest, opts ...grpc.CallOption) (*BS, error) {
	out := new(BS)
	err := c.cc.Invoke(ctx, "/v2.main_bootstrap.services.BSService/GetBootstrap", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

var bSServiceListBootstrapStreamDesc = &grpc.StreamDesc{
	StreamName: "ListBootstrap",
}

func (c *bSServiceClient) ListBootstrap(ctx context.Context, in *ListBSRequest, opts ...grpc.CallOption) (*ListBSResponse, error) {
	out := new(ListBSResponse)
	err := c.cc.Invoke(ctx, "/v2.main_bootstrap.services.BSService/ListBootstrap", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

var bSServiceExecuteBootstrapStreamDesc = &grpc.StreamDesc{
	StreamName: "ExecuteBootstrap",
}

func (c *bSServiceClient) ExecuteBootstrap(ctx context.Context, in *GetBSRequest, opts ...grpc.CallOption) (*empty.Empty, error) {
	out := new(empty.Empty)
	err := c.cc.Invoke(ctx, "/v2.main_bootstrap.services.BSService/ExecuteBootstrap", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

var bSServiceDeleteBootstrapStreamDesc = &grpc.StreamDesc{
	StreamName: "DeleteBootstrap",
}

func (c *bSServiceClient) DeleteBootstrap(ctx context.Context, in *GetBSRequest, opts ...grpc.CallOption) (*empty.Empty, error) {
	out := new(empty.Empty)
	err := c.cc.Invoke(ctx, "/v2.main_bootstrap.services.BSService/DeleteBootstrap", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// BSServiceService is the service API for BSService service.
// Fields should be assigned to their respective handler implementations only before
// RegisterBSServiceService is called.  Any unassigned fields will result in the
// handler for that method returning an Unimplemented error.
type BSServiceService struct {
	// hide
	NewBootstrap     func(BSService_NewBootstrapServer) error
	GetBootstrap     func(context.Context, *GetBSRequest) (*BS, error)
	ListBootstrap    func(context.Context, *ListBSRequest) (*ListBSResponse, error)
	ExecuteBootstrap func(context.Context, *GetBSRequest) (*empty.Empty, error)
	DeleteBootstrap  func(context.Context, *GetBSRequest) (*empty.Empty, error)
}

func (s *BSServiceService) newBootstrap(_ interface{}, stream grpc.ServerStream) error {
	if s.NewBootstrap == nil {
		return status.Errorf(codes.Unimplemented, "method NewBootstrap not implemented")
	}
	return s.NewBootstrap(&bSServiceNewBootstrapServer{stream})
}
func (s *BSServiceService) getBootstrap(_ interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	if s.GetBootstrap == nil {
		return nil, status.Errorf(codes.Unimplemented, "method GetBootstrap not implemented")
	}
	in := new(GetBSRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return s.GetBootstrap(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     s,
		FullMethod: "/v2.main_bootstrap.services.BSService/GetBootstrap",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return s.GetBootstrap(ctx, req.(*GetBSRequest))
	}
	return interceptor(ctx, in, info, handler)
}
func (s *BSServiceService) listBootstrap(_ interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	if s.ListBootstrap == nil {
		return nil, status.Errorf(codes.Unimplemented, "method ListBootstrap not implemented")
	}
	in := new(ListBSRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return s.ListBootstrap(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     s,
		FullMethod: "/v2.main_bootstrap.services.BSService/ListBootstrap",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return s.ListBootstrap(ctx, req.(*ListBSRequest))
	}
	return interceptor(ctx, in, info, handler)
}
func (s *BSServiceService) executeBootstrap(_ interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	if s.ExecuteBootstrap == nil {
		return nil, status.Errorf(codes.Unimplemented, "method ExecuteBootstrap not implemented")
	}
	in := new(GetBSRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return s.ExecuteBootstrap(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     s,
		FullMethod: "/v2.main_bootstrap.services.BSService/ExecuteBootstrap",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return s.ExecuteBootstrap(ctx, req.(*GetBSRequest))
	}
	return interceptor(ctx, in, info, handler)
}
func (s *BSServiceService) deleteBootstrap(_ interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	if s.DeleteBootstrap == nil {
		return nil, status.Errorf(codes.Unimplemented, "method DeleteBootstrap not implemented")
	}
	in := new(GetBSRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return s.DeleteBootstrap(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     s,
		FullMethod: "/v2.main_bootstrap.services.BSService/DeleteBootstrap",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return s.DeleteBootstrap(ctx, req.(*GetBSRequest))
	}
	return interceptor(ctx, in, info, handler)
}

type BSService_NewBootstrapServer interface {
	SendAndClose(*NewBSResponse) error
	Recv() (*NewBSRequest, error)
	grpc.ServerStream
}

type bSServiceNewBootstrapServer struct {
	grpc.ServerStream
}

func (x *bSServiceNewBootstrapServer) SendAndClose(m *NewBSResponse) error {
	return x.ServerStream.SendMsg(m)
}

func (x *bSServiceNewBootstrapServer) Recv() (*NewBSRequest, error) {
	m := new(NewBSRequest)
	if err := x.ServerStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

// RegisterBSServiceService registers a service implementation with a gRPC server.
func RegisterBSServiceService(s grpc.ServiceRegistrar, srv *BSServiceService) {
	sd := grpc.ServiceDesc{
		ServiceName: "v2.main_bootstrap.services.BSService",
		Methods: []grpc.MethodDesc{
			{
				MethodName: "GetBootstrap",
				Handler:    srv.getBootstrap,
			},
			{
				MethodName: "ListBootstrap",
				Handler:    srv.listBootstrap,
			},
			{
				MethodName: "ExecuteBootstrap",
				Handler:    srv.executeBootstrap,
			},
			{
				MethodName: "DeleteBootstrap",
				Handler:    srv.deleteBootstrap,
			},
		},
		Streams: []grpc.StreamDesc{
			{
				StreamName:    "NewBootstrap",
				Handler:       srv.newBootstrap,
				ClientStreams: true,
			},
		},
		Metadata: "main_bootstrap_services.proto",
	}

	s.RegisterService(&sd, nil)
}

// NewBSServiceService creates a new BSServiceService containing the
// implemented methods of the BSService service in s.  Any unimplemented
// methods will result in the gRPC server returning an UNIMPLEMENTED status to the client.
// This includes situations where the method handler is misspelled or has the wrong
// signature.  For this reason, this function should be used with great care and
// is not recommended to be used by most users.
func NewBSServiceService(s interface{}) *BSServiceService {
	ns := &BSServiceService{}
	if h, ok := s.(interface {
		NewBootstrap(BSService_NewBootstrapServer) error
	}); ok {
		ns.NewBootstrap = h.NewBootstrap
	}
	if h, ok := s.(interface {
		GetBootstrap(context.Context, *GetBSRequest) (*BS, error)
	}); ok {
		ns.GetBootstrap = h.GetBootstrap
	}
	if h, ok := s.(interface {
		ListBootstrap(context.Context, *ListBSRequest) (*ListBSResponse, error)
	}); ok {
		ns.ListBootstrap = h.ListBootstrap
	}
	if h, ok := s.(interface {
		ExecuteBootstrap(context.Context, *GetBSRequest) (*empty.Empty, error)
	}); ok {
		ns.ExecuteBootstrap = h.ExecuteBootstrap
	}
	if h, ok := s.(interface {
		DeleteBootstrap(context.Context, *GetBSRequest) (*empty.Empty, error)
	}); ok {
		ns.DeleteBootstrap = h.DeleteBootstrap
	}
	return ns
}

// UnstableBSServiceService is the service API for BSService service.
// New methods may be added to this interface if they are added to the service
// definition, which is not a backward-compatible change.  For this reason,
// use of this type is not recommended.
type UnstableBSServiceService interface {
	// hide
	NewBootstrap(BSService_NewBootstrapServer) error
	GetBootstrap(context.Context, *GetBSRequest) (*BS, error)
	ListBootstrap(context.Context, *ListBSRequest) (*ListBSResponse, error)
	ExecuteBootstrap(context.Context, *GetBSRequest) (*empty.Empty, error)
	DeleteBootstrap(context.Context, *GetBSRequest) (*empty.Empty, error)
}