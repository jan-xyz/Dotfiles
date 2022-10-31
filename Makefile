version := 0.3.2

# build tools

.PHONY: all
all: check build

.PHONY: check
check: vet lint staticcheck test

.PHONY: build
build:
	go build .

.PHONY: test
test:
	go test ./... -race -coverprofile=coverage.out -covermode=atomic

.PHONY: lint
lint:
	go vet ./...
	go run honnef.co/go/tools/cmd/staticcheck@latest ./...
	go run github.com/mgechev/revive@latest -set_exit_status ./...
	go run golang.org/x/vuln/cmd/govulncheck@latest ./...

.PHONY: stylua
stylua:
	stylua --check .

.PHONY: clean
clean:
	go clean

# Dotfiles usage

.PHONY: download
download: dotfiles-$(version)

dotfiles-$(version):
	rm -f dotfiles-*
	curl -L https://github.com/jan-xyz/Dotfiles/releases/download/v$(version)/dotfiles-Darwin-x86_64.gz | gzip -N -d > dotfiles-$(version)
	chmod +x ./dotfiles-$(version)

.PHONY: run
run: download
	./dotfiles-$(version) install
