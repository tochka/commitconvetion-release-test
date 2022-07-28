.PHONY: all clean

BINARY=bin/hello
VERSION=$(shell git tag | tail -1)
BUILD=$(shell git rev-parse HEAD | cut -c1-7)
LDFLAGS=-ldflags "-X main.Version=$(VERSION) -X main.Build=$(BUILD)"


.PHONY: build
build:
	go build $(LDFLAGS) -o $(BINARY) .

.PHONY: test
test:
	go test -v -cover -coverprofile=coverage.out  ./...

.PHONY: clean
clean:
	-rm $(BINARY)

.PHONY: lint
lint:
	golangci-lint run .

.PHONY: dependencies
dependencies:
	go mod tidy