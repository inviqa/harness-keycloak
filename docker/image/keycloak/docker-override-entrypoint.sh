#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make deprecated DB specific variables obsolete
function unset_legacy_vars() {
  local suffixes=(ADDR DATABASE USER PASSWORD PORT)
  for suffix in "${suffixes[@]}"; do
    unset "$1_$suffix"
  done
}
unset_legacy_vars `echo $DB_VENDOR | tr a-z A-Z`

exec "$__dir/docker-entrypoint.sh" "$@"
