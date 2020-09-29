package pass

import (
	"bytes"
	"encoding/base64"
	"errors"

	"github.com/gorilla/securecookie"
	"golang.org/x/crypto/argon2"
)

const (
	timeCost   = 3
	memoryCost = 16 * 1024
	threads    = 4
	keyLength  = 48
)

var (
	// ErrHashFailed - signaling a hashing failure
	ErrHashFailed = errors.New("crypto: hash failed")
)

// didHashFail - checks to see if the hash is empty (all zeros)
func didHashFail(s []byte) bool {
	for _, v := range s {
		if v != 0 {
			return false
		}
	}
	return true
}

// doHash - actually does the hashing
func doHash(password, salt []byte) []byte {
	return argon2.IDKey(password, salt, timeCost, memoryCost, threads, keyLength)
}

// GenerateRandomKey - wraps gorilla/securecookie's GenerateRandomKey
func GenerateRandomKey(length int) []byte {
	return securecookie.GenerateRandomKey(length)
}

// toBase64 - turns an unencoded []byte into a base64 encoded string
func toBase64(input []byte) string {
	return base64.StdEncoding.EncodeToString(input)
}

// fromBase64 - converts a base64 encoded string into a unencoded []byte
func fromBase64(input string) ([]byte, error) {
	return base64.StdEncoding.DecodeString(input)
}

// Hash - generates the Argon2i hash of a given password
// returns the hash and the salt that was used to create the hash
// these values are base64 encoded
func Hash(password string) (string, string, error) {
	unencodedSalt := GenerateRandomKey(32)
	if unencodedSalt == nil {
		return "", "", ErrHashFailed
	}
	unencodedHash := doHash([]byte(password), unencodedSalt)
	if didHashFail(unencodedHash) {
		return "", "", ErrHashFailed
	}
	hash := toBase64(unencodedHash)
	salt := toBase64(unencodedSalt)
	// fmt.Println(hash)
	// fmt.Println(salt)
	return hash, salt, nil
}

// VerifyHash - takes a password, a base64 encoded hash, and a base64 encoded salt
// returns true if the password matches the hash
func VerifyHash(password, hash, salt string) bool {
	decodedHash, err := fromBase64(hash)
	if err != nil {
		return false
	}
	// fmt.Printf("decodedHash: %s\n", string(decodedHash))
	decodedSalt, err := fromBase64(salt)
	if err != nil {
		return false
	}
	// fmt.Printf("decoded salt: %s\n", decodedSalt)
	testHash := doHash([]byte(password), decodedSalt)
	// fmt.Printf("hashedpassword: %s\n", testHash)
	return bytes.Equal(decodedHash, testHash)
}
