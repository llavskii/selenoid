#!/bin/bash

set -e

export GO111MODULE="on"
go test -tags 's3 metadata' -v -race -coverprofile=coverage.txt -covermode=atomic -coverpkg github.com/llavskii/selenoid,github.com/llavskii/selenoid/session,github.com/llavskii/selenoid/config,github.com/llavskii/selenoid/protect,github.com/llavskii/selenoid/service,github.com/llavskii/selenoid/upload,github.com/llavskii/selenoid/info,github.com/llavskii/selenoid/jsonerror

go install golang.org/x/vuln/cmd/govulncheck@latest
"$(go env GOPATH)"/bin/govulncheck -tags production ./...
