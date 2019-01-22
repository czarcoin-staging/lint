FROM golangci/golangci-lint:latest

VOLUME /source
VOLUME /modcache

COPY .golangci.yml /lint/.golangci.yml
COPY entrypoint.sh /lint/entrypoint.sh

WORKDIR /source

CMD ["/lint/entrypoint.sh"]
