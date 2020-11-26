#!/bin/bash

set -eo pipefail
source /opt/local/bin/x-set-shell-fonts-env.sh

msg_info "[INFO] Ensure auxiliary files"
sudo mkdir -p --mode=2770 ${X_VSCODE_WORK_DIR}/.devcontainer/{tmp,var,var/log}
sudo chmod 2770 ${X_VSCODE_WORK_DIR}/.devcontainer/{tmp,var,var/log}
cat /dev/null | sudo tee ${X_VSCODE_WORK_DIR}/.devcontainer/var/log/{.bash_history,.psql_history,.mysql_history}
sudo chmod 660 ${X_VSCODE_WORK_DIR}/.devcontainer/var/log/{.bash_history,.psql_history,.mysql_history}
msg_success "[SUCCESS] Ensure auxiliary files"

msg_info "[INFO] Ensure VSCode extensions dir"
sudo mkdir -p --mode=2775 \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server/extensions \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server-insiders \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server-insiders/extensions
sudo chmod 2775 \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server/extensions \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server-insiders \
  ${X_VSCODE_WORK_DIR}/.devcontainer/.vscode-server-insiders/extensions
msg_success "[SUCCESS] Ensure VSCode extensions dir"

msg_info "[INFO] Ensure file permission"
sudo find ${X_VSCODE_WORK_DIR} -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 --no-run-if-empty sudo setfacl -R --remove-all
sudo find ${X_VSCODE_WORK_DIR} -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 --no-run-if-empty sudo setfacl -R -m default:group::rwx,default:other:rx
sudo find ${X_VSCODE_WORK_DIR} -mindepth 1 -maxdepth 1 -print0 | xargs -0 --no-run-if-empty sudo chown -R ${X_DEV_USER_ID}:${X_DEV_GROUP_ID}
sudo find ${X_VSCODE_WORK_DIR} -mindepth 1 -maxdepth 1 -print0 | xargs -0 --no-run-if-empty sudo chmod -R g=u
sudo find ${X_VSCODE_WORK_DIR} -mindepth 1 -type d -print0 | xargs -0 --no-run-if-empty sudo chmod g+rwxs
msg_success "[SUCCESS] Ensure file permission"
