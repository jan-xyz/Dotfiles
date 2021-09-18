version := 0.3.1

# Go build tools

check: test vet lint staticcheck

build:
	go build .

test:
	go test ./internal/...

vet:
	go vet ./internal/...

lint:
	go run github.com/mgechev/revive@latest ./internal/...

staticcheck:
	go run honnef.co/go/tools/cmd/staticcheck@latest ./internal/...

stylua:
	stylua --check .

# Dotfiles usage

download: dotfiles-$(version)

dotfiles-$(version):
	rm -f dotfiles-*
	curl -L https://github.com/jan-xyz/Dotfiles/releases/download/v$(version)/dotfiles-Darwin-x86_64.gz | gzip -N -d > dotfiles-$(version)
	chmod +x ./dotfiles-$(version)

run: download
	./dotfiles-$(version) install
