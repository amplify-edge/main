package service

import (
	"context"
	"log"
	"os"
	"testing"

	pb "github.com/getcouragenow/modules/mod-disco/server/pkg/api"
	"github.com/joho/godotenv"

	glog "google.golang.org/grpc/grpclog"
)

var (
	testServer   *Server
	testAnswerID string
)

func TestGlobal(t *testing.T) {
	// server
	t.Run("New Server", testNew)
	t.Run("Migrate csv", testMigrate)
	// answer
	t.Run("New New Answer", testNewAnswer)
	t.Run("Get Answer", testGetAnswer)
	t.Run("List Answers", testListAnswers)
	t.Run("Delete Answer", testDeleteAnswer)
	// campaigns
	t.Run("Get a campaign", testGetCampaign)
	t.Run("List all campaigns", testListCampaigns)
	// support roles
	t.Run("Get support role", testGetSupportRole)
	t.Run("List support list", testListSupportRoles)
	// users
	t.Run("Get user", testGetUser)
	t.Run("List users", testListUsers)
}

// Create new server
func testNew(t *testing.T) {
	err := godotenv.Load("../../env.sample")
	if err != nil {
		log.Fatalf("Couldn't open config file: %v", err)
	}
	testServer, err = New(context.Background(), glog.NewLoggerV2(os.Stdout, os.Stdout, os.Stderr))
	if err != nil {
		t.Fatalf("Error to create a new Server: %v", err)
	}
}

func testMigrate(t *testing.T) {
	_, err := testServer.Migrate(context.Background(), &pb.MigrateRequest{
		Datapath: "../../data/outputs/datadump"},
	)
	if err != nil {
		t.Fatalf("Error when trying to migrate data to minio: %v", err)
	}
}

func testNewAnswer(t *testing.T) {
	res, err := testServer.NewAnswer(context.Background(), &pb.NewAnswerRequest{
		Id:               "ThisIsFirstOne",
		SelSupportRoleId: "1",
		SelCampaignId:    "1",
		MinHoursPledged:  "5",
	})
	if err != nil {
		t.Fatalf("Error when trying to create a new Answer: %v", err)
	}

	if !res.Success {
		t.Fatalf("Error to create a new answer")
	}

	testAnswerID = res.Id
}

func testGetAnswer(t *testing.T) {
	_, err := testServer.GetAnswer(context.Background(), &pb.AnswerIdRequest{Id: testAnswerID})
	if err != nil {
		t.Fatalf("Error when trying to get an answer: %v", err)
	}
}

func testListAnswers(t *testing.T) {
	_, err := testServer.ListAnswers(context.Background(), &pb.ListAnswersRequest{})
	if err != nil {
		t.Fatalf("Error when trying to list answers: %v", err)
	}
}

func testDeleteAnswer(t *testing.T) {
	_, err := testServer.DeleteAnswer(context.Background(), &pb.AnswerIdRequest{Id: testAnswerID})
	if err != nil {
		t.Fatalf("Error when trying to delete an answer: %v", err)
	}
}

func testGetCampaign(t *testing.T) {
	camID := "campaign_001"
	cam, err := testServer.GetCampaign(context.Background(), &pb.GetCampaignRequest{
		Id: camID},
	)
	if err != nil {
		t.Fatalf("Error when trying to get a campaign: %v", err)
	}

	if cam.CampaignId != camID {
		t.Errorf("Error to get a campaign id should be %v but got %v", camID, cam.CampaignId)
	}
}

func testListCampaigns(t *testing.T) {
	cam, err := testServer.ListCampaigns(context.Background(), &pb.ListCampaignRequest{})
	if err != nil {
		t.Fatalf("Error when trying to list campaigns: %v", err)
	}

	if len(cam.Campaigns) <= 0 {
		t.Errorf("Error to list campaigns, got %v", cam.Campaigns)
	}

}

func testGetSupportRole(t *testing.T) {
	testRoleID := "crg001"
	supRol, err := testServer.GetSupportRole(context.Background(),
		&pb.GetSupportRoleRequest{Id: testRoleID})
	if err != nil {
		t.Fatalf("Error when trying to get supported rolles: %v", err)
	}

	if supRol.Id != testRoleID {
		t.Errorf("Error to get support role, got id equal to: %v but should be: %v",
			supRol.Id, testRoleID)
	}
}

func testListSupportRoles(t *testing.T) {
	roles, err := testServer.ListSupportRoles(context.Background(), &pb.ListSupportRoleRequest{})
	if err != nil {
		t.Fatalf("Error when trying to list supported rolles: %v", err)
	}

	if len(roles.SupportRoles) <= 0 {
		t.Errorf("Error to list support roles: got empty list: %v", roles.SupportRoles)
	}
}

func testGetUser(t *testing.T) {
	testUserID := "user001"
	user, err := testServer.GetUser(context.Background(), &pb.GetUserRequest{Id: testUserID})
	if err != nil {
		t.Fatalf("Error when trying to get a user: %v", err)
	}

	if user.Id != testUserID {
		t.Errorf("Error to get user, got id equal to: %v but should be: %v",
			user.Id, testUserID)
	}
}

func testListUsers(t *testing.T) {
	users, err := testServer.ListUsers(context.Background(), &pb.ListUserRequest{})
	if err != nil {
		t.Fatalf("Error when trying to list users: %v", err)
	}

	if len(users.Users) <= 0 {
		t.Errorf("Error to list users got empty list: %v", users.Users)
	}
}
