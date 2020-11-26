#!/bin/bash

set -eo pipefail
source /opt/local/bin/x-set-shell-fonts-env.sh
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/environment.default.sh

msg_info "[INFO] VSCode postStartCommand"

if [[ "${X_OTHER_TOOLCHAINS[@]}" ]]; then
  msg_info "[INFO] Ensure latest Rust toolchains"
  RUSTUP_USE_CURL=1 ${CARGO_HOME}/bin/rustup update stable ${X_OTHER_TOOLCHAINS[@]}
  msg_success "[SUCCESS] Ensure latest Rust toolchains"
fi

if [[ "${X_CARGO_BINARIES[@]}" ]]; then
  msg_info "[INFO] Update existing Rust binaries [${X_CARGO_BINARIES[*]}]"
  # cargo install-update ${X_CARGO_BINARIES[@]}
  cargo install-update --all
  msg_success "[SUCCESS] Update existing Rust binaries [${X_CARGO_BINARIES[*]}]"
fi

source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/ensure-files.default.sh
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/ensure-files-rust.default.sh
msg_success "[SUCCESS] VSCode postStartCommand"
