FROM golangci/golangci-lint:latest

VOLUME /source
VOLUME /modcache

COPY .golangci.yml /lint/.golangci.yml
COPY entrypoint.sh /lint/entrypoint.sh

RUN apt-get update \
 && apt-get install -y wget \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/storj/storj/master/scripts/check-copyright.go -O /lint/check-copyright.go \
 && wget https://raw.githubusercontent.com/storj/storj/master/scripts/check-imports.go   -O /lint/check-imports.go

RUN go get -d golang.org/x/tools/go/packages

WORKDIR /source

CMD ["/lint/entrypoint.sh"]
