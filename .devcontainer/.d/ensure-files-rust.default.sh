#!/bin/bash

set -eo pipefail
source /opt/local/bin/x-set-shell-fonts-env.sh

msg_info "[INFO] Ensure Rust files"
sudo mkdir -p --mode=2775 ${RUSTUP_HOME} ${CARGO_HOME}
sudo setfacl -R --remove-all ${RUSTUP_HOME} ${CARGO_HOME}
sudo setfacl -R -m default:group::rwx,default:other:rx ${RUSTUP_HOME} ${CARGO_HOME}
sudo chown -R ${X_DEV_USER_ID}:${X_DEV_GROUP_ID} ${RUSTUP_HOME} ${CARGO_HOME}
sudo chmod 2775 ${RUSTUP_HOME} ${CARGO_HOME}
sudo chmod -R g=u ${RUSTUP_HOME} ${RUSTUP_HOME} ${CARGO_HOME}
sudo find ${RUSTUP_HOME} -type d -print0 | xargs -0 --no-run-if-empty sudo chmod g+rwxs
sudo find ${CARGO_HOME} -type d -print0 | xargs -0 --no-run-if-empty sudo chmod g+rwxs
[[ -e ~/.rustup ]] || ln -sf ${RUSTUP_HOME} ~/.rustup
[[ -e ~/.cargo ]] || ln -sf ${CARGO_HOME} ~/.cargo
msg_success "[SUCCESS] Ensure Rust files"
