#!/bin/bash
apt add -no-cache rust cargo

mix deps.get
mix compile

