#!/bin/bash

set -eo pipefail
source /opt/local/bin/x-set-shell-fonts-env.sh
source ${X_VSCODE_WORK_DIR}/.devcontainer/.d/environment.default.sh

msg_info "[INFO] VSCode postCreateCommand"

msg_info "[INFO] Install Rust"
cd /var/tmp
if [[ ! -e ${CARGO_HOME}/bin/rustup ]]; then
  export RUSTUP_INIT_SKIP_PATH_CHECK=yes
  curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain stable --profile default --component rust-src llvm-tools-preview
fi
export CARGO_BUILD_JOBS=$(($(nproc) > 1 ? $(nproc) - 1 : 1))
cat <<-'HEND' >~/.profile.d/rust

# rust
# [[ ! -r "${HOME}/.cargo/env" ]] || . "${HOME}/.cargo/env"
# [[ ":${PATH}:" = *":${HOME}/.cargo/bin:"* ]] || export PATH="${HOME}/.cargo/bin:${PATH}"
[[ ":${PATH}:" = *":${CARGO_HOME}/bin:"* ]] || export PATH="${CARGO_HOME}/bin:${PATH}"
export CARGO_BUILD_JOBS=$((`nproc` > 1 ? `nproc` - 1  : 1))
HEND

# source ${HOME}/.cargo/env
mkdir -p --mode=0700 ~/.bash_completion.d
${CARGO_HOME}/bin/rustup completions bash >~/.bash_completion.d/rustup
${CARGO_HOME}/bin/rustup completions bash cargo >~/.bash_completion.d/cargo
# sed --in-place -e '/^source\s\+$(rustc\s\+.\+/ s/^#*/#/' ~/.bash_completion.d/cargo
sed --in-place -e 's/^\([^#].*\)/# \1/g' ~/.bash_completion.d/cargo
cat <<-'HEND' >>~/.bash_completion.d/cargo

# custom
X_RUST_SYSROOT=$(${CARGO_HOME}/bin/rustc +stable --print sysroot)
[[ ! -r ${X_RUST_SYSROOT}/etc/bash_completion.d/cargo ]] || source ${X_RUST_SYSROOT}/etc/bash_completion.d/cargo
HEND
msg_success "[SUCCESS] Install Rust-$(${CARGO_HOME}/bin/rustc --version)"

if [[ "${X_OTHER_TOOLCHAINS[@]}" ]]; then
  cd /var/tmp
  for _tc in ${X_OTHER_TOOLCHAINS[@]}; do
    if ! grep --quiet -E "^${_tc}-.+-linux-gnu$" <<<$(${CARGO_HOME}/bin/rustup toolchain list); then
      msg_info "[INFO] Install Rust other toolchains [${_tc}]"
      ${CARGO_HOME}/bin/rustup install --profile default ${_tc}
      ${CARGO_HOME}/bin/rustup component add --toolchain=${_tc} rust-src llvm-tools-preview
      msg_success "[SUCCESS] Install Rust other toolchains [${_tc}]"
    fi
  done
fi

if [[ "${X_CARGO_BINARIES[@]}" ]]; then
  msg_info "[INFO] Install Rust binaries [${X_CARGO_BINARIES[*]}]"
  cd /var/tmp
  # ${CARGO_HOME}/bin/cargo +stable install --quiet ${X_CARGO_BINARIES[@]}
  ${CARGO_HOME}/bin/cargo +stable install ${X_CARGO_BINARIES[@]}
  msg_success "[SUCCESS] Install Rust binaries [${X_CARGO_BINARIES[*]}]"
fi

msg_info "[INFO] Link Rust system toolchain"
${CARGO_HOME}/bin/rustup toolchain link system /usr
${CARGO_HOME}/bin/rustup default system
msg_success "[SUCCESS] Link Rust system toolchain"

msg_info "[INFO] Set history files"
cat <<-'HEND' >>~/.bashrc

## VSCode Remote Container
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a"
export HISTSIZE=500
export HISTFILESIZE=500
export HISTCONTROL=ignoreboth
export HISTFILE=${X_VSCODE_WORK_DIR}/.devcontainer/var/log/.bash_history
export PSQL_HISTORY=${X_VSCODE_WORK_DIR}/.devcontainer/var/log/.psql_history
export MYSQL_HISTFILE=${X_VSCODE_WORK_DIR}/.devcontainer/var/log/.mysql_history
HEND
msg_success "[SUCCESS] Set history files"

msg_success "[SUCCESS] VSCode postCreateCommand"
