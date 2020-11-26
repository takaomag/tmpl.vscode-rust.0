#!/bin/bash

set -eo pipefail
source /opt/local/bin/x-set-shell-fonts-env.sh
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/environment.default.sh

msg_info "[INFO] VSCode updateContentCommand"
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/ensure-files.default.sh
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/ensure-files-rust.default.sh
msg_success "[SUCCESS] VSCode updateContentCommand"
