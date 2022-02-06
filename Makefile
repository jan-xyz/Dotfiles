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
	go test ./internal/... -race -coverprofile=coverage.txt -covermode=atomic

.PHONY: vet
vet:
	go vet ./internal/...

.PHONY: lint
lint:
	go run github.com/mgechev/revive@latest ./internal/...

.PHONY: staticcheck
staticcheck:
	go run honnef.co/go/tools/cmd/staticcheck@latest ./internal/...

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
