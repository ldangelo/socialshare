# Dockerfile.build
FROM bitwalker/alpine-elixir-phoenix
ENV HOME=/opt/app/ TERM=xterm

RUN apk add --no-cache rust cargo

