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
	@# the fish key bindings join this file into one line, so a comment would disable all later options
	! grep -n '#' fzf/fzfrc

.PHONY: test
test:
	nvim --headless +qa
