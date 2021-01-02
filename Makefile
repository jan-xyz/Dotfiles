check: test vet lint staticcheck

build:
	go build .

test:
	go test ./internal/...

vet:
	go vet ./internal/...

lint:
	go run golang.org/x/lint/golint -set_exit_status ./internal/...

staticcheck:
	go run honnef.co/go/tools/cmd/staticcheck ./internal/...

