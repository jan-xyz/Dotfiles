package dotfiles

import "github.com/stretchr/testify/mock"

// Commander is the interface to mock the exec.Command.
type Commander func(string, ...string) ([]byte, error)

// MockCommander allows to test packages individually without creating
// anything real.
type MockCommander struct {
	mock.Mock
}

// Output is the mock that gets called when running some command
func (c *MockCommander) Output(command string, arguments ...string) ([]byte, error) {
	args := c.Called(command, arguments)
	return args[0].([]byte), args.Error(1)
}

// OnOutput is a helper function to specify epxectations on the mock.
func (c *MockCommander) OnOutput(command string, arguments []string) *OutputCall {
	return &OutputCall{c.On("Output", command, arguments)}
}

type OutputCall struct {
	*mock.Call
}

func (o *OutputCall) Return(output []byte, err error) {
	o.Call.Return(output, err)
}
