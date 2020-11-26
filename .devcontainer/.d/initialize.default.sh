#!/bin/bash

set -eo pipefail

X_VSCODE_WORK_DIR=$(pwd)

source /opt/local/bin/x-set-shell-fonts-env.sh
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/environment.default.sh

# X_DEV_USER_ID=$(ls -ldn .devcontainer | awk '{print $3}')
# X_DEV_GROUP_ID=$(ls -ldn .devcontainer | awk '{print $4}')
# export X_VSCODE_WORK_DIR X_DEV_USER_ID X_DEV_GROUP_ID

msg_info "[INFO] VSCode initializeCommand"
msg_success "[SUCCESS] VSCode initializeCommand"
