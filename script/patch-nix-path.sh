#!/usr/bin/env bash
set -xeuo pipefail

prefix="$1"

for f in $(find $prefix -type f); do
  if file "$f" | grep -q 'text'; then
    sed -i -e 's|#\!\s*/nix/store/[a-z0-9\._-]*/bin/|#\! /usr/bin/env |g' "$f"
    sed -i -e 's|/nix/store/[a-z0-9\._-]*/bin/||g' "$f"
  fi
done
