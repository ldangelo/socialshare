#!/bin/bash
mix deps.get
mix compile

export SCRAPETIMER=600000

MIX_ENV=test mix ecto.create
MIX_ENV=test mix ecto.migrate
mix test
