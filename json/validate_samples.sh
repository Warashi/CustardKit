#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
schema="$repo_root/json/custard.schema.json"
cue_schema="$repo_root/cue/custard.schema.cue"

examples=("$repo_root"/json/examples/*.json)
invalids=("$repo_root"/json/invalid/*.json)
swift_results=("$repo_root"/swift/results/*.json)

jq empty "$schema"

for fixture in "${examples[@]}"; do
  cue vet "$cue_schema" "$fixture" -d '#custard'
  jv -q "$schema" "$fixture"
done

for fixture in "${swift_results[@]}"; do
  cue vet "$cue_schema" "$fixture" -d '#custard'
  jv -q "$schema" "$fixture"
done

for fixture in "${invalids[@]}"; do
  if cue vet "$cue_schema" "$fixture" -d '#custard' >/dev/null; then
    echo "expected CUE validation failure: $fixture" >&2
    exit 1
  fi
  if jv -q "$schema" "$fixture"; then
    echo "expected JSON Schema validation failure: $fixture" >&2
    exit 1
  fi
done
