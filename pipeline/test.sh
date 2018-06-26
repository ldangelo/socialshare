#!/bin/bash
mix compile
MIX_ENV=test mix ecto.create
MIX_ENV=test mix ecto.migrate
mix test
