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

// ExpectOutput is a helper function to specify epxectations on the mock.
func (c *MockCommander) ExpectOutput(command string, arguments []string, mockReturn []byte, err error) {
	c.On("Output", command, arguments).Return(mockReturn, err).Once()
}
