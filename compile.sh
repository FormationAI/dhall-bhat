#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

for f in `find . -not -path '*/\.*' -type f -not -iname "*.md" -not -iname "*.sh" -not -iname "Makefile"`
do
  # Echo the filename
  echo $f;
  # Compile the Dhall file
  dhall <<< $f;
  # Separate the output
  echo ""; echo "";
done
