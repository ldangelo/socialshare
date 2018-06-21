#!/bin/bash
mix deps.get
mix package
mix docker.init
mix docker.build

