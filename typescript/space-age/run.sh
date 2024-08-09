#!/usr/bin/env bash

set -x

corepack yarn tsc --module node16 $1.ts
corepack yarn node $1.js
corepack yarn test

set +x
