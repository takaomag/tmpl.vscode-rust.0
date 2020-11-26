#!/bin/bash

set -eo pipefail

if [[ "$(uname -m)" == 'x86_64' ]]; then
  export X_OTHER_TOOLCHAINS=('beta' 'nightly')
  export X_CARGO_BINARIES=(
    'cargo-update'
    'cargo-cache'
    'cargo-edit'
    'cargo-make'
    'cargo-outdated'
    'cargo-tarpaulin'
    'cargo-fuzz'
    'hyperfine'
    'cargo-profiler'
    'flamegraph'
    'cargo-audit'
    'cargo-license'
    'cargo-readme'
  )
else
  export X_OTHER_TOOLCHAINS=('beta')
  export X_CARGO_BINARIES=(
    'cargo-update'
    'cargo-edit'
  )
fi
