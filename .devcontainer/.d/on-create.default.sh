#!/bin/bash

set -eo pipefail
source /opt/local/bin/x-set-shell-fonts-env.sh
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/environment.default.sh

msg_info "[INFO] VSCode onCreateCommand"
msg_success "[SUCCESS] VSCode onCreateCommand"
