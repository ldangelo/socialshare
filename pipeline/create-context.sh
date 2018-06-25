#!/bin/sh

ls ..

echo "before mkdir"
mkdir /tmp/app

echo "after mkdir"

ls -R

cp -R dev/rel/socialshare /tmp/app/socialshare 
echo "after cp"
