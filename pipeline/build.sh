#!/bin/bash
mix compile
mix release.init
mix release

cp -R _build ../app
