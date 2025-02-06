version := 0.3.6

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
	go run honnef.co/go/tools/cmd/staticcheck ./...
	go run github.com/mgechev/revive -set_exit_status ./...
	go run golang.org/x/vuln/cmd/govulncheck ./...
	go run mvdan.cc/gofumpt -d -e .
	go run github.com/princjef/gomarkdoc/cmd/gomarkdoc --check --output "{{.Dir}}/README.md" ./internal/... 

fmt:
	go run mvdan.cc/gofumpt -w .

docs:
	go run github.com/princjef/gomarkdoc/cmd/gomarkdoc --output "{{.Dir}}/README.md" ./internal/... 


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
	curl -L https://github.com/jan-xyz/Dotfiles/releases/download/v$(version)/dotfiles-Darwin-arm64.gz | gzip -N -d > dotfiles-$(version)
	chmod +x ./dotfiles-$(version)

.PHONY: run
run: download
	./dotfiles-$(version) install
