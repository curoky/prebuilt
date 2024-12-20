#!/usr/bin/env bash
set -xeuo pipefail

prefix="$1"

for f in $(find $prefix -type f); do
  if file "$f" | grep -q 'ELF'; then
    strip --strip-unneeded "$f"
  fi
done
