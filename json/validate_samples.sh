#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
schema="$repo_root/json/custard.schema.json"

jq empty "$schema"
jv "$schema" "$repo_root"/swift/results/*.json

for fixture in "$repo_root"/json/invalid/*.json; do
  if jv -q "$schema" "$fixture"; then
    echo "expected validation failure: $fixture" >&2
    exit 1
  fi
done
