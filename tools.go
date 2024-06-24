//go:build tools
// +build tools

package main

import (
	_ "github.com/mgechev/revive"
	_ "golang.org/x/vuln/cmd/govulncheck"
	_ "honnef.co/go/tools/cmd/staticcheck"
)
