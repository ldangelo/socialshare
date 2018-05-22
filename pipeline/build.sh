#!/bin/bash
apk add --no-cache rust cargo

cargo update

mix deps.get
mix do compile, test

