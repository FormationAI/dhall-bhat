#!/bin/sh

set -e

for f in `find . -not -path '*/\.*' -type f -not -iname "*.md" -not -iname "*.sh" -not -iname "Makefile"`
do
  echo $f;
  dhall <<< $f;
  echo "\n\n";
done
