#!/usr/bin/bash

corepack yarn install
corepack yarn dlx @yarnpkg/sdks base
corepack yarn test
