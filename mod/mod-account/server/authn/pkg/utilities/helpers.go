package utilities

import (
	uuid "github.com/hashicorp/go-uuid"
)

func NewID() string {
	// Yes discards error
	s, _ := uuid.GenerateUUID()
	return s
}
