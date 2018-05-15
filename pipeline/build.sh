#!/bin/bash
apk add -no-cache rust cargo

mix deps.get
mix compile

