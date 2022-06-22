package mailer

import (
	"os"
	"testing"
)

var mailer = Mail{
	Domain:      "localhost",
	Templates:   "./testdata/mail",
	Host:        "localhost",
	Port:        1025,
	Encryption:  "none",
	FromAddress: "me@here.com",
	FromName:    "Joe",
	Jobs:        make(chan Message, 1),
	Results:     make(chan Result, 1),
}

func TestMain(m *testing.M) {
	go mailer.ListenForMail()

	code := m.Run()

	os.Exit(code)
}
