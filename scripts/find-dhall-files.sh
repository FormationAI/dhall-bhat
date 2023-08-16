#!/usr/bin/env bash

find . \
  -not -path '*\.json' \
  -not -path '*\.md' \
  -not -path '*\.yaml' \
  -not -path '\.*' \
  -not -iname "LICENSE" \
  -not -iname "Makefile" \
  -not -path 'docs/*' \
  -not -path 'flake/*' \
  -not -path 'scripts/*' \
  "$@"
