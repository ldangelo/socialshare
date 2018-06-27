#!/bin/bash
mix deps.get
mix compile
mix release.init
mix release

cp -R _build ../app
