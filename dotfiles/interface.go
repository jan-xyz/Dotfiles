package dotfiles

type Commander func(string, ...string) ([]byte, error)
