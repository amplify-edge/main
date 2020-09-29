package mockstore

import (
	"encoding/json"
	"errors"
	"github.com/getcouragenow/main/mod/mod-account/server/authn/pkg/store"
	"io/ioutil"
)

const (
	mockdata = "./mock-data/user-data.json"
)

// MockStore implements store.Storer interface
type MockStore struct {
}

func (m *MockStore) listUsers() (*store.Users, error) {
	var users store.Users
	file, err := ioutil.ReadFile(mockdata)
	if err != nil {
		return nil, err
	}
	if err := json.Unmarshal(file, &users); err != nil {
		return nil, err
	}
	return &users, nil
}

func (m *MockStore) ListUsers() (*store.Users, error) {
	return m.listUsers()
}

func (m *MockStore) filterBy(filterFunc func(*store.User) bool) (*store.User, error) {
	users, err := m.listUsers()
	if err != nil {
		return nil, err
	}
	for _, u := range users.Users {
		if filterFunc(&u) {
			return &u, nil
		}
	}
	return nil, errors.New("User not found")
}

func (m *MockStore) GetUserById(id string) (*store.User, error) {
	return m.filterBy(func(u *store.User) bool {
		return u.UserID == id
	})
}

func (m *MockStore) GetUserByRole(role string) (*store.User, error) {
	return m.filterBy(func(u *store.User) bool {
		return u.Role == role
	})
}
