check: test vet lint staticcheck

test:
	go test ./dotfiles/...

vet:
	go vet ./dotfiles/...

lint:
	go run golang.org/x/lint/golint ./dotfiles/...

staticcheck:
	go run honnef.co/go/tools/cmd/staticcheck ./dotfiles/...

