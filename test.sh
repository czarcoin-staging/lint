docker build -t storj/lint:dev .

docker run --rm \
	-v "${PWD}/source":/source \
	-v "${GOPATH}/pkg/mod":/go/pkg/mod \
	storj/lint:dev