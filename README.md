Linux or Mac:

```
docker run --rm \
	-v "${PWD}":/source \
	-v "${GOPATH}/pkg/mod":/go/pkg/mod \
	storj/lint:dev
```

Windows: 

```
docker run --rm -v "%CD%":/source -v "%GOPATH%/pkg/mod":/go/pkg/mod storj/lint:dev
```