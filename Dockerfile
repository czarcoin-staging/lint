FROM golangci/golangci-lint:latest

RUN apt-get update
RUN apt-get install tree

VOLUME /source
VOLUME /modcache

COPY config.yaml   /lint/config.yaml
COPY entrypoint.sh /lint/entrypoint.sh

WORKDIR /source

CMD ["/lint/entrypoint.sh"]
