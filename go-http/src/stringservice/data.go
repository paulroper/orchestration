package stringservice

type uppercaseRequest struct {
	Input string `json:"input"`
}

type uppercaseResponse struct {
	Output string `json:"output"`
	Err    string `json:"err,omitempty"`
}

type countRequest struct {
	Input string `json:"input"`
}

type countResponse struct {
	Output int `json:"output"`
}
