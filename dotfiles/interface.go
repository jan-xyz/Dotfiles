package dotfiles

// Commander is the interface to mock the exec.Command.
type Commander func(string, ...string) ([]byte, error)
