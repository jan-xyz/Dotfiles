check: test vet lint

test:
	go test ./dotfiles/...

vet:
	go vet ./dotfiles/...

lint:
	go run golang.org/x/lint/golint ./dotfiles/...
	go run honnef.co/go/tools/cmd/staticcheck ./dotfiles/...
