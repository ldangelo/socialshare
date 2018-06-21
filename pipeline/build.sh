#!/bin/bash
mix deps.get
mix compile
mix docker.init
mix docker.build

