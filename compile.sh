#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

for f in `find . -not -path '*/\.*' -type f -not -iname "*.md" -not -iname "*.sh" -not -iname "Makefile"`
do
  # Echo the filename
  echo $f;
  # Compile the Dhall file
  TMPFILE=$(mktemp --tmpdir dhall-bhat.XXXXXXXXXX)
  dhall <<< $f >/dev/null 2>$TMPFILE || (cat $TMPFILE && exit 1)
  rm $TMPFILE
done
