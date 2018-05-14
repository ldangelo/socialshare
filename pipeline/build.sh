#!/bin/bash
curl https://sh.rustup.rs -sSf | sh

mix deps.get
mix compile

