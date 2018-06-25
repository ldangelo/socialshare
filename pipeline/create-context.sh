#!/bin/sh

echo "before mkdir"
mkdir /tmp/app

echo "after mkdir"

ls -r _build

cp -R _build/dev/rel/socialshare /tmp/app/socialshare 
echo "after cp"
