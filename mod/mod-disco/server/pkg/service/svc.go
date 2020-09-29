package service

import (
	"bytes"
	"context"
	"encoding/base64"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"os"
	"strconv"

	pb "github.com/getcouragenow/modules/mod-disco/server/pkg/api"
	"github.com/getcouragenow/modules/mod-disco/server/pkg/config"
	"github.com/getcouragenow/modules/mod-disco/server/pkg/store/minio"
	"github.com/golang/protobuf/proto"
	"github.com/golang/protobuf/ptypes/empty"
	glog "google.golang.org/grpc/grpclog"
)

// Server struct
type Server struct {
	store  *minio.Ministore
	logger glog.LoggerV2
}

// TODO: There are some fields generate errors when marshaling like fields
// of type:
// 1- time
// 2- list string([]string)

// TODO client shouldnt' know anything about minio or buckets

// New creates new instance of Svc,
func New(ctx context.Context, logger glog.LoggerV2) (*Server, error) {
	cfg, err := config.NewCfg()
	if err != nil {
		return nil, err
	}

	store, err := minio.New(ctx, cfg.ConnOpt)
	if err != nil {
		return nil, err
	}

	return &Server{
		store,
		logger,
	}, nil
}

// NewWithCfg creates new instance of Svc with configs.
func NewWithCfg(ctx context.Context, logger glog.LoggerV2, cfg *config.ModMainCfg) (*Server, error) {
	store, err := minio.New(ctx, cfg.ConnOpt)
	if err != nil {
		return nil, err
	}

	return &Server{
		store,
		logger,
	}, nil
}

var (
	validSupportRoles = map[int]string{
		1: "Lawyer",
	}
	validOrgIds = map[int]string{
		1: "NY State Pipeline Shutdown",
	}
)

var (
	errInvalidSupportRoleID = errors.New("selected SupportRole is invalid")
	errInvalidOrgID         = errors.New("selected Org is invalid")
)

// NewAnswer create a new answer
func (s *Server) NewAnswer(ctx context.Context, newreq *pb.NewAnswerRequest) (*pb.NewAnswerResponse, error) {
	// Manual validation for both campaign/ org id and SupportRole id for now
	supRoleID, err := strconv.Atoi(newreq.SelSupportRoleId)
	if err != nil {
		return nil, errInvalidSupportRoleID
	}
	if _, ok := validSupportRoles[supRoleID]; !ok {
		return nil, errInvalidSupportRoleID
	}
	orgID, err := strconv.Atoi(newreq.SelCampaignId)
	if err != nil {
		return nil, errInvalidOrgID
	}
	if _, ok := validOrgIds[orgID]; !ok {
		return nil, errInvalidOrgID
	}
	temp, err := ioutil.TempFile("/tmp", "answers-"+newreq.Id)
	if err != nil {
		log.Fatal(err)
	}
	defer os.Remove(temp.Name())
	name := newreq.SelCampaignId + "-" + newreq.SelSupportRoleId + "-" + newreq.Id
	// name := newreq.Id
	_, err = s.store.Put(ctx, name, temp)
	if err != nil {
		return nil, err
	}
	return &pb.NewAnswerResponse{
		Success: true,
		Id:      name,
	}, nil
}

// GetAnswer get an answer
func (s *Server) GetAnswer(ctx context.Context, getreq *pb.AnswerIdRequest) (*pb.Answer, error) {
	f, err := s.store.Open(ctx, getreq.Id)
	if err != nil {
		return nil, err
	}
	ans, err := readSeekerProto(f)
	if err != nil {
		return nil, err
	}
	return ans, nil
}

// DeleteAnswer delete an answer
func (s *Server) DeleteAnswer(ctx context.Context, delreq *pb.AnswerIdRequest) (*pb.DeleteAnswerResponse, error) {
	err := s.store.Remove(delreq.GetId())
	if err != nil {
		return nil, err
	}
	return &pb.DeleteAnswerResponse{
		Success: true,
	}, nil
}

// ListAnswers list all answers
func (s *Server) ListAnswers(ctx context.Context, listreq *pb.ListAnswersRequest) (*pb.Answers, error) {
	var answers []*pb.Answer
	prefix := listreq.GetCampaignId() + "-" + listreq.GetSupportRoleId()
	rs, err := s.store.List(ctx, prefix)
	if err != nil {
		return nil, err
	}
	for _, f := range rs {
		ans, err := readSeekerProto(f)
		if err != nil {
			return nil, err
		}
		answers = append(answers, ans)
	}
	return &pb.Answers{Answers: answers}, nil
}

// GetUser get a user by id
func (s *Server) GetUser(ctx context.Context, req *pb.GetUserRequest) (*pb.User, error) {
	userQuery := minio.NewSingleQuery(`
	SELECT _id AS id, firstName AS first_name, lastName AS last_name, email,
	displayName AS display_name, avatar_url AS avatar, chatgroup_ids AS chatgroup_ids,
	campaigns AS campaign from s3object WHERE _id =	
	`,
		fmt.Sprintf("'%v'", req.GetId()),
		"user[0-9]{3}",
	)

	resp, err := s.store.GetSingle(ctx, userQuery, "users.csv")
	if err != nil {
		return nil, err
	}
	resp = fixBytesSingle(resp)

	var user pb.User
	// if err := proto.Unmarshal(resp, &user); err != nil {
	// 	return nil, err
	// }
	if err := json.Unmarshal(resp, &user); err != nil {
		return nil, err
	}

	return &user, nil
}

// ListUsers list all users
func (s *Server) ListUsers(ctx context.Context, _ *pb.ListUserRequest) (*pb.Users, error) {
	usersQuery := minio.NewListQuery(`
	SELECT _id AS id, firstName AS first_name, lastName AS last_name, email,
	displayName AS display_name, avatar_url AS avatar, chatgroup_ids AS chatgroup_ids,
	campaigns AS campaign from s3object`,
	)
	resp, err := s.store.GetMultiple(ctx, usersQuery, "users.csv")
	if err != nil {
		return nil, err
	}
	resp = fixBytesList(resp, "users")

	var users pb.Users
	// if err := proto.Unmarshal(resp, &users); err != nil {
	// 	return nil, err
	// }
	if err := json.Unmarshal(resp, &users); err != nil {
		return nil, err
	}

	return &users, nil
}

// GetSupportRole get supported roles
func (s *Server) GetSupportRole(ctx context.Context, req *pb.GetSupportRoleRequest) (*pb.SupportRole, error) {
	roleQuery := minio.NewSingleQuery(
		`
			SELECT id, name, comment, mandatory, uom from s3object
			WHERE id =
		`,
		fmt.Sprintf("'%v'", req.GetId()), "crg[0-9]{3}",
	)

	// roleQuery := minio.NewSingleQuery(
	// 	`
	// 		SELECT id, name, comment, uom from s3object
	// 		WHERE id =
	// 		`,
	// 	fmt.Sprintf("'%v'", req.GetId()), "crg[0-9]{3}",
	// )

	resp, err := s.store.GetSingle(ctx, roleQuery, "roles.csv")
	if err != nil {
		return nil, err
	}

	resp = fixBytesSingle(resp)

	// var supportRole pb.SupportRole
	// if err := proto.Unmarshal(resp, &supportRole); err != nil {
	// 	return nil, err
	// }

	supportRole, err := pb.SupportRoleFromBytes(resp)
	if err != nil {
		return nil, err
	}

	// if err := json.Unmarshal(resp, &supportRole); err != nil {
	// 	return nil, err
	// }
	return supportRole, nil
}

// ListSupportRoles list all supported roles
func (s *Server) ListSupportRoles(ctx context.Context, req *pb.ListSupportRoleRequest) (*pb.SupportRoles, error) {

	rolesQuery := minio.NewListQuery(
		`SELECT id, name, comment, mandatory, uom from s3object`,
	)

	// rolesQuery := minio.NewListQuery(
	// 	`SELECT id, name, comment, uom from s3object`,
	// )

	resp, err := s.store.GetMultiple(ctx, rolesQuery, "roles.csv")
	if err != nil {
		return nil, err
	}

	resp = fixBytesList(resp, "support_roles")

	// var supportRoles pb.SupportRoles
	// if err := proto.Unmarshal(resp, &supportRoles); err != nil {
	// 	return nil, err
	// }

	supportRoles, err := pb.ListSupportRolesFromBytes(resp)
	if err != nil {
		return nil, err
	}

	// if err := json.Unmarshal(resp, &supportRoles); err != nil {
	// 	return nil, err
	// }
	return supportRoles, nil
}

// GetCampaign get a campaign by id.
func (s *Server) GetCampaign(ctx context.Context, req *pb.GetCampaignRequest) (*pb.Campaign, error) {
	campaignQuery := minio.NewSingleQuery(
		`
		SELECT campaign_id, campaign_name, logo_url, goal, crg_quantity_many,
		crg_ids_many, already_pledged, datetime, location AS action_location, start AS min_pioneers,
		mass_media AS min_rebels_for_media, win AS min_rebels_to_win, action_type, backing_org, category,
		contact, historical_precedents AS hist_precedents, organization, strategy, video_url, uom,
		action_length FROM s3object WHERE campaign_id=
		`,
		fmt.Sprintf("'%v'", req.GetId()),
		"campaign_[0-9]{3}",
	)

	resp, err := s.store.GetSingle(ctx, campaignQuery, "campaign.csv")
	if err != nil {
		return nil, err
	}
	resp = fixBytesSingle(resp)

	// var campaign pb.Campaign
	// TODO fix error EOF using proto.Unmarshal
	// if err := proto.Unmarshal(resp, &campaign); err != nil {
	// 	return nil, err
	// }

	campaign, err := pb.CampaignFromBytes(resp)
	if err != nil {
		return nil, err
	}
	// if err := json.Unmarshal(resp, &campaign); err != nil {
	// 	return nil, err
	// }

	return campaign, nil
}

// ListCampaigns list all available campaigns
func (s *Server) ListCampaigns(ctx context.Context, req *pb.ListCampaignRequest) (*pb.Campaigns, error) {
	campaignsQuery := minio.NewListQuery(
		`
				SELECT campaign_id, campaign_name, logo_url, goal, crg_quantity_many,
				crg_ids_many, already_pledged, datetime AS action_time, location AS action_location, start AS min_pioneers,
				mass_media AS min_rebels_for_media, win AS min_rebels_to_win, action_type, backing_org, category,
				contact, historical_precedents AS hist_precedents, organization, strategy, video_url, uom,
				action_length FROM s3object
				`,
	)

	resp, err := s.store.GetMultiple(ctx, campaignsQuery, "campaign.csv")
	if err != nil {
		return nil, err
	}
	resp = fixBytesList(resp, "campaigns")

	// var campaigns pb.Campaigns
	// TODO fix error EOF using proto.Unmarshal
	// if err := proto.Unmarshal(resp, &campaigns); err.Error() != "unexpected EOF" {
	// 	return nil, err
	// }

	campaigns, err := pb.ListCampaignsFromBytes(resp)
	if err != nil {
		return nil, err
	}

	// if err := json.Unmarshal(resp, &campaigns); err != nil {
	// 	return nil, err
	// }

	return campaigns, nil
}

// Migrate migrate csv files to minio.
func (s *Server) Migrate(ctx context.Context, req *pb.MigrateRequest) (*empty.Empty, error) {
	// TODO: need to secure this
	// Migrate csv's
	if err := s.store.Migrate(ctx, req.GetDatapath()); err != nil {
		return nil, err
	}

	// Migrate Images
	// if err := s.store.MigrateImages(ctx, req.GetDatapath()+"/json"); err != nil {
	// 	return nil, err
	// }
	return &empty.Empty{}, nil
}

// NewFile new file upload
func (s *Server) NewFile(stream pb.Question_NewFileServer) error {
	ctx := stream.Context()
	chunckFileInfo, err := stream.Recv()
	if err != nil {
		return err
	}

	fileInfo := pb.File{
		Name:        chunckFileInfo.File.Name,
		TotalChunks: chunckFileInfo.File.TotalChunks,
	}
	fmt.Println("-------------------------------------")
	fmt.Println("New Request to upload a file received")
	fmt.Println("File Name: ", fileInfo.Name)
	fmt.Println("-------------------------------------")
	fmt.Println("Total Chunks: ", fileInfo.TotalChunks)

	ack := &pb.Ack{Status: true}
	err = stream.Send(ack)
	if err != nil {
		return err
	}
	chunks := make([]string, fileInfo.TotalChunks)

	for {
		c, err := stream.Recv()
		if err != nil {
			return err
		}

		fmt.Printf("New Chunk received id:%v\n", c.Id)

		// send ack to client
		ack.Status = true
		err = stream.Send(ack)
		if err != nil && err != io.EOF {
			return err
		}

		chunks = append(chunks, c.Data)
		if fileInfo.TotalChunks == c.Id {
			break
		}
	}

	buf := []byte{}
	for _, chu := range chunks {
		// decode base64
		des, err := base64.StdEncoding.DecodeString(chu)
		if err != nil {
			return err
		}
		buf = append(buf, des...)
	}

	obj := bytes.NewReader(buf)
	_, err = s.store.Put(ctx, fileInfo.Name, obj)

	return err
}

func readSeekerProto(f io.ReadSeeker) (*pb.Answer, error) {
	var ans pb.Answer
	res, err := ioutil.ReadAll(f)
	if err != nil {
		return nil, err
	}
	if err := proto.Unmarshal(res, &ans); err != nil {
		return nil, err
	}
	return &ans, nil
}

func fixBytesSingle(data []byte) []byte {
	// a hack fix should find better solution: allows to delete the coma from the end
	return data[:len(data)-2]
}

func fixBytesList(data []byte, name string) []byte {
	// a hack fix should find better solution: allows to add list brackets
	// and delete coma from the end.
	data = append([]byte(fmt.Sprintf("{\"%v\":[\n", name)), data...)
	data = append(data[:len(data)-2], []byte("]}")...)
	return data
}
