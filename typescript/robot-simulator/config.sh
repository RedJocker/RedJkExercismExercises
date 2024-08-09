#!/usr/bin/bash

#sed -i 's/\.meta/\.exercism/g' ./package.json
corepack yarn install
corepack yarn dlx @yarnpkg/sdks base
sed -E -i 's/^(\s*)xit/\1it/g' *.test.ts
sed -E -i 's/,\s*xit//g' *.test.ts
