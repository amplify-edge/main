package main

import (
	"context"
	"crypto/tls"
	"encoding/base64"
	"errors"
	"flag"
	"fmt"
	"io"
	"math"
	"os"
	"path/filepath"
	"time"

	pb "github.com/getcouragenow/modules/mod-disco/server/pkg/api"
	"github.com/johnsiilver/getcert"

	// pb "github.com/getcouragenow/modules/mod-disco/server/pkg/api"
	"log"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

// TODO extend for env vars needed
// Env vars should be in the k8s deployment (i.e. helm charts via secrets)

const fileChunk = 1 * (1 << 12) // 1 MB, change this to your requirement

func main() {
	// printTestDataFiles()
	local := flag.Bool("local", true, "connect with local server")

	var conn *grpc.ClientConn
	var err error
	if *local {
		// Connect with local server
		conn, err = grpc.Dial("127.0.0.1:8081", grpc.WithInsecure())
		if err != nil {
			log.Fatalf("Couldnt connect to service: %v", err)
		}
	} else {
		// Connect with remote server
		tlsCert, _, err := getcert.FromTLSServer("grpc.maintemplate.ci.getcouragenow.org:443", false)
		if err != nil {
			log.Fatalf("Couldnt get tlsCert: %v", err)
		}

		config := &tls.Config{
			Certificates: []tls.Certificate{tlsCert},
		}
		conn, err = grpc.Dial("grpc.maintemplate.ci.getcouragenow.org:443",
			grpc.WithTransportCredentials(credentials.NewTLS(config)))
	}

	defer conn.Close()

	c := pb.NewQuestionClient(conn)

	ctx, cancel := context.WithTimeout(context.Background(), 8*time.Second)
	defer cancel()

	// upload a file to server
	// err = newFile(ctx, c, "data/outputs/datadump/json/campaign/1at5cSl3cvQM59r4f_acwZ7Tl6HUwK4So.png", true)
	// if err != nil {
	// 	log.Fatalln("Got an error when upload the file", err)
	// }

	// Migrate csv's to minio
	// _, err = c.Migrate(ctx, &pb.MigrateRequest{Datapath: "data/outputs/datadump/"})
	// if err != nil {
	// 	log.Fatalf("Error while Migrate data: %v", err)
	// }

	campaings, err := c.ListCampaigns(ctx, &pb.ListCampaignRequest{})
	if err != nil {
		log.Fatalf("Error while getting answer: %v", err)
	}
	log.Println("----------------All Campaigns---------------------")
	log.Println(campaings)
	log.Printf("-------------------------------------")

	campaing, err := c.GetCampaign(ctx, &pb.GetCampaignRequest{Id: "campaign_001"})
	if err != nil {
		log.Fatalf("Error while getting answer: %v", err)
	}
	log.Println("----------------Campaign ID 001---------------------")
	log.Println(campaing)
	log.Printf("-------------------------------------")

	supRol, err := c.GetSupportRole(context.Background(),
		&pb.GetSupportRoleRequest{Id: "crg001"})
	if err != nil {
		log.Fatalf("Error while getting roles: %v", err)
	}

	log.Println("----------------All Supported Role id crg001---------------------")
	log.Println(supRol)
	log.Printf("-------------------------------------")

	roles, err := c.ListSupportRoles(context.Background(), &pb.ListSupportRoleRequest{})
	if err != nil {
		log.Fatalf("Error while getting answer: %v", err)
	}

	log.Println("----------------All Supported Roles---------------------")
	log.Println(roles)
	log.Printf("-------------------------------------")

	// user, err := c.GetUser(context.Background(), &pb.GetUserRequest{Id: "user001"})
	// if err != nil {
	// 	log.Fatalf("Error while getting user: %v", err)
	// }
	// log.Println("----------------user id 001---------------------")
	// log.Println(user)
	// log.Printf("-------------------------------------")

	// users, err := c.ListUsers(context.Background(), &pb.ListUserRequest{})
	// if err != nil {
	// 	log.Fatalf("Error while getting users: %v", err)
	// }
	// log.Println("----------------All users---------------------")
	// log.Println(users)
	// log.Printf("-------------------------------------")
}

func printTestDataFiles() {
	var files []string

	root := "../data/outputs/datadump/"
	err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
		files = append(files, path)
		return nil
	})
	if err != nil {
		panic(err)
	}
	for _, file := range files {
		fmt.Println(file)
	}
}

func newFile(ctx context.Context, c pb.QuestionClient, filePath string, useAck bool) error {
	file, err := os.Open(filePath)

	if err != nil {
		return err
	}
	defer file.Close()

	fileInfo, err := file.Stat()
	if err != nil {
		return err
	}

	var fileSize int64 = fileInfo.Size()
	totalChunks := uint64(math.Ceil(float64(fileSize) / float64(fileChunk)))

	i := uint64(1)
	partSize := int64(math.Min(fileChunk, float64(fileSize-int64(i*fileChunk))))
	if fileSize < fileChunk {
		partSize = fileSize
	}

	buffer := make([]byte, partSize)

	// first chunk used to send info about file like name, extension and total of chunks.
	firstChunk := &pb.Chunk{
		File: &pb.File{
			Name:        fileInfo.Name(),
			TotalChunks: totalChunks,
		},
	}

	// Subscribe to stream
	stream, err := c.NewFile(ctx)
	if err != nil {
		return err
	}

	// send first chunk to server
	err = stream.Send(firstChunk)
	if err != nil {
		log.Fatal(err)
	}

	if useAck {
		// wait ti recive the ack from server
		ack, err := stream.Recv()
		if err != nil {
			log.Fatal(err)
		}

		// check if there is an ok from the server to start sending chunks
		if !ack.Status {
			return errors.New("Error Ack status")
		}
	}

	fmt.Println("------------------------------------------------")
	fmt.Println(firstChunk.File)
	fmt.Println("------------------------------------------------")
	for {
		file.Read(buffer)
		// encode chunk to base64
		dataEnc := base64.StdEncoding.EncodeToString(buffer)

		chunk := &pb.Chunk{
			Id:   i,
			Data: dataEnc,
		}

		err = stream.Send(chunk)
		fmt.Println("chunk sended: ", i)
		if err != nil && err != io.EOF {
			return err
		}

		// wait to recive the ack from server
		ack, err := stream.Recv()
		if err != nil && err != io.EOF {
			return err
		}
		fmt.Println("Ack status ", ack.Status)
		// check if there is an ok from the server to start sending chunks
		if !ack.Status {
			return errors.New("Error Ack status")
		}

		if i == totalChunks {
			break
		}

		i++
	}
	return nil
}
