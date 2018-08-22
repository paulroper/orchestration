package stringservice

import (
	"context"
	"errors"
	"strings"
)

// StringService service definition
type StringService interface {
	Uppercase(context.Context, string) (string, error)
	Count(context.Context, string) int
}

var errEmpty = errors.New("Empty string")

func (stringService) Uppercase(_ context.Context, s string) (string, error) {
	if s == "" {
		return "", errEmpty
	}

	return strings.ToUpper(s), nil
}

func (stringService) Count(_ context.Context, s string) int {
	return len(s)
}
