docker build -t storj/lint:dev .

docker run \
	-v "${PWD}/source":/source \
	-v "${GOPATH}/pkg/mod":/modcache \
	storj/lint:dev
