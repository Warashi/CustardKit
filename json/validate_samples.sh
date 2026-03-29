#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
schema="$repo_root/json/custard.schema.json"
cue_schema="$repo_root/cue/custard.schema.cue"

examples=("$repo_root"/json/examples/*.json)
cue_examples=("$repo_root"/cue/examples/*.cue)
invalids=("$repo_root"/json/invalid/*.json)
swift_results=("$repo_root"/swift/results/*.json)

jq empty "$schema"

validate_json_fixture() {
  local fixture="$1"
  local tmpdir
  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' RETURN

  if jq -e 'type == "array"' "$fixture" >/dev/null; then
    while IFS= read -r item; do
      printf '%s\n' "$item" > "$tmpdir/item.json"
      cue vet "$cue_schema" "$tmpdir/item.json" -d '#custard'
      jv -q "$schema" "$tmpdir/item.json"
    done < <(jq -c '.[]' "$fixture")
  else
    cue vet "$cue_schema" "$fixture" -d '#custard'
    jv -q "$schema" "$fixture"
  fi
}

validate_cue_fixture() {
  local fixture="$1"
  local generated_json="$2"
  local tmpdir
  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' RETURN

  cue export "$fixture" > "$tmpdir/generated.json"

  while IFS= read -r item; do
    printf '%s\n' "$item" > "$tmpdir/item.json"
    cue vet "$cue_schema" "$tmpdir/item.json" -d '#custard'
    jv -q "$schema" "$tmpdir/item.json"
  done < <(jq -c 'if type == "array" then .[] else . end' "$tmpdir/generated.json")

  diff -u <(jq -S . "$tmpdir/generated.json") <(jq -S . "$generated_json")
}

for fixture in "${cue_examples[@]}"; do
  generated_json="$repo_root/json/examples/$(basename "${fixture%.cue}").json"
  if [[ ! -f "$generated_json" ]]; then
    echo "missing generated JSON example: $generated_json" >&2
    exit 1
  fi

  validate_cue_fixture "$fixture" "$generated_json"
done

for fixture in "${examples[@]}"; do
  validate_json_fixture "$fixture"
done

for fixture in "${swift_results[@]}"; do
  validate_json_fixture "$fixture"
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
