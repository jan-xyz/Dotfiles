check: test vet lint staticcheck

test:
	go test ./dotfiles/...

vet:
	go vet ./dotfiles/...

lint:
	go run golang.org/x/lint/golint -set_exit_status ./dotfiles/...

staticcheck:
	go run honnef.co/go/tools/cmd/staticcheck ./dotfiles/...

