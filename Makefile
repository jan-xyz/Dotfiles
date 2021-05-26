version := 0.2.2

# Go build tools

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

# Dotfiles usage

download: dotfiles-$(version)

dotfiles-$(version):
	rm -f dotfiles-*
	curl -L https://github.com/jan-xyz/Dotfiles/releases/download/v$(version)/dotfiles-Darwin-x86_64.gz | gzip -N -d > dotfiles-$(version)
	chmod +x ./dotfiles-$(version)

run: download
	./dotfiles-$(version) install
