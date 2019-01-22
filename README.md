# storj/lint

This Docker container implements running linter on a Go package with modules.

## Installing

To create the docker image:

```
docker build -t storj/lint:dev .
```

## Running

Inside the linted repository with `go.mod` run:

Linux or Mac:

```
docker run --rm -v "${PWD}":/source -v "${GOPATH}/pkg/mod":/go/pkg/mod storj/lint:dev
```

Windows: 

```
docker run --rm -v "%CD%":/source -v "%GOPATH%/pkg/mod":/go/pkg/mod storj/lint:dev
```

The specified volumes are needed:

1. The source code: `-v "${PWD}":/source`. To get the source code into the container.
2. The module cache: `-v "${GOPATH}/pkg/mod":/go/pkg/mod`. To avoid redownloading modules every time you run it.
