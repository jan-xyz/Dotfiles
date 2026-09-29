.PHONY: install
install:
	./install.sh

.PHONY: fmt
fmt:
	stylua .

.PHONY: lint
lint:
	stylua --check .
	shellcheck install.sh macos.sh
	fish --no-execute fish/config.fish fish/functions/*.fish

.PHONY: test
test:
	nvim --headless +qa
