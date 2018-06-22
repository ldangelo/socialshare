#!/bin/bash
mix deps.get
mix compile
mix release.init
mix release
