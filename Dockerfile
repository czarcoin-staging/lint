FROM golangci/golangci-lint:latest

VOLUME /source
VOLUME /modcache

COPY config.yaml   /lint/config.yaml
COPY entrypoint.sh /lint/entrypoint.sh

WORKDIR /source

CMD ["/lint/entrypoint.sh"]