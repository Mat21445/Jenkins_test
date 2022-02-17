dep:
	go get -u github.com/jstemmer/go-junit-report
	go mod tidy

test: dep
	go test -v -tags="unit integration" -covermode=atomic -coverprofile=coverage.out 2>&1 | go-junit-report -set-exit-code > report.xml
	go tool cover -func coverage.out