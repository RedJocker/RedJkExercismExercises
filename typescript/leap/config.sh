#!/usr/bin/bash

sed -i 's/\.meta/\.exercism/g' ./package.json
corepack yarn install
corepack yarn dlx @yarnpkg/sdks base
