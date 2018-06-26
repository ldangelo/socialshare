#!/bin/sh

# let's see what's in our parent directories?
ls -R ..

mkdir /tmp/app

# copy the artifacts to the app directory
cp -R ../_build/dev/rel/socialshare /tmp/app/socialshare 
