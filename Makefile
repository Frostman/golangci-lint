test:
	go install ./cmd/... # needed for govet and golint if go < 1.10
	GL_TEST_RUN=1 golangci-lint run -v
	GL_TEST_RUN=1 golangci-lint run --fast --no-config -v
	GL_TEST_RUN=1 golangci-lint run --no-config -v
	GL_TEST_RUN=1 go test -v ./...

assets:
	svg-term --cast=183662 --out docs/demo.svg --window --width 110 --height 30 --from 2000 --to 20000 --profile Dracula --term iterm2

readme:
	go run ./scripts/gen_readme/main.go

check_generated:
	make readme && git diff --exit-code # check no changes

release:
	rm -rf dist
	curl -sL https://git.io/goreleaser | bash

.PHONY: test
