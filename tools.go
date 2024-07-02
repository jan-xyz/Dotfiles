//go:build tools
// +build tools

package main

import (
	_ "github.com/mgechev/revive"
	_ "github.com/princjef/gomarkdoc"
	_ "golang.org/x/vuln/cmd/govulncheck"
	_ "honnef.co/go/tools/cmd/staticcheck"
	_ "mvdan.cc/gofumpt"

	// go mod tidy keeps removing a
	// dependency for `gomarkdoc`
	_ "github.com/princjef/termdiff"
)
