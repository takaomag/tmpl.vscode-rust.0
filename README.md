tmpl.vscode-rust.0
==========================

Developer Ready: A VSCode boilerplate template for Rust projects.

## Ensure shared directories

<u>Example</u>

```
sudo mkdir -p --mode=2775 /opt/project/share/rust && \
sudo setfacl --remove-all /opt/project /opt/project/share && \
sudo setfacl -R --remove-all /opt/project/share/rust && \
sudo setfacl -m default:group::rwx,default:other:rx /opt/project /opt/project/share && \
sudo setfacl -R -m default:group::rwx,default:other:rx /opt/project/share/rust && \
sudo chown root:developer /opt/project /opt/project/share && \
sudo chown -R root:developer /opt/project/share/rust && \
sudo chmod 2775 /opt/project /opt/project/share /opt/project/share/rust && \
sudo chmod -R g=u /opt/project/share/rust && \
echo 'Success'

sudo mkdir -p --mode=2775 /opt/project/share/rust.aarch64-unknown-linux-gnu && \
sudo setfacl --remove-all /opt/project /opt/project/share && \
sudo setfacl -R --remove-all /opt/project/share/rust.aarch64-unknown-linux-gnu && \
sudo setfacl -m default:group::rwx,default:other:rx /opt/project /opt/project/share && \
sudo setfacl -R -m default:group::rwx,default:other:rx /opt/project/share/rust.aarch64-unknown-linux-gnu && \
sudo chown root:developer /opt/project /opt/project/share && \
sudo chown -R root:developer /opt/project/share/rust.aarch64-unknown-linux-gnu && \
sudo chmod 2775 /opt/project /opt/project/share /opt/project/share/rust.aarch64-unknown-linux-gnu && \
sudo chmod -R g=u /opt/project/share/rust.aarch64-unknown-linux-gnu && \
echo 'Success'
```

## Setup a project from this template repository

1. Create a repository from this template repository.

2. Clone the new repository somewhere.

3. In the cloned directory, replace some strings and create symbolic links.

```
X_PROJECT_NAME='project-name' && \
rm -rf .github/workflows && \
rm -rf .devcontainer.docker && \
mkdir -p .devcontainer/.vscode-server/extensions && \
mkdir -p .devcontainer/.vscode-server-insiders/extensions && \
sed --in-place -e "s/tmpl.vscode-rust.0/${X_PROJECT_NAME}/g" .devcontainer/.d/devcontainer.default.json && \
ln -sf .editorconfig.d/.editorconfig.default .editorconfig && \
cd .vscode && \
ln -sf .d/extensions.default.json extensions.json && \
ln -sf .d/launch.default.json launch.json && \
ln -sf .d/settings.default.json settings.json && \
ln -sf .d/tasks.default.json tasks.json && \
cd ../.devcontainer && \
# ln -sf .d/.dockerignore.default .dockerignore && \
# ln -sf .d/Dockerfile.archlinux.default Dockerfile && \
ln -sf .d/devcontainer.default.json devcontainer.json && \
ln -sf .d/initialize.default.sh initialize.sh && \
ln -sf .d/on-create.default.sh on-create.sh && \
ln -sf .d/update-content.default.sh update-content.sh && \
ln -sf .d/post-create.default.sh post-create.sh && \
ln -sf .d/post-start.default.sh post-start.sh && \
ln -sf .d/post-attach.default.sh post-attach.sh && \
cd .. && \
echo 'Success'
```

## Setup a project within a VSCode multi-root workspace from this template repository

1. Create a repository from this template repository.

2. Create a workspace directory.

3. Clone the new repository somewhere under the workspace directory.

4. In the cloned directory, replace some strings and create symbolic links.

```
X_WORKSPACE_NAME='ws-name' && \
X_PROJECT_NAME='project-name' && \
mkdir -p .devcontainer/.vscode-server/extensions && \
mkdir -p .devcontainer/.vscode-server-insiders/extensions && \
sed --in-place -e "s/tmpl.vscode-rust.0/${X_WORKSPACE_NAME}/g" .devcontainer/.d/devcontainer.default.json && \
sed --in-place -e "s/tmpl.vscode-rust.0/${X_PROJECT_NAME}/g" .vscode/.d/example.code-workspace && \
mv .devcontainer ../. && \
mv .vscode/.d/example.code-workspace ../${X_WORKSPACE_NAME}.code-workspace && \
ln -sf .editorconfig.d/.editorconfig.default .editorconfig && \
cd .vscode && \
ln -sf .d/extensions.default.json extensions.json && \
ln -sf .d/launch.default.json launch.json && \
ln -sf .d/settings.default.json settings.json && \
ln -sf .d/tasks.default.json tasks.json && \
cd ../../.devcontainer && \
ln -sf .d/.dockerignore.default .dockerignore && \
ln -sf .d/Dockerfile.archlinux.default Dockerfile && \
ln -sf .d/devcontainer.default.json devcontainer.json && \
ln -sf .d/initialize.default.sh initialize.sh && \
ln -sf .d/on-create.default.sh on-create.sh && \
ln -sf .d/update-content.default.sh update-content.sh && \
ln -sf .d/post-create.default.sh post-create.sh && \
ln -sf .d/post-start.default.sh post-start.sh && \
ln -sf .d/post-attach.default.sh post-attach.sh && \
cd .. && \
echo 'Success'
```

## Add a project within an existing VSCode multi-root workspace from this template repository

1. Create a repository from this template repository.

2. Change the current working dir to an existing workspace directory.

3. Clone the new repository somewhere under the workspace directory.

4. In the cloned directory, replace some strings and create symbolic links.

```
rm -rf .devcontainer && \
ln -sf .editorconfig.d/.editorconfig.default .editorconfig && \
rm .vscode/.d/example.code-workspace && \
cd .vscode && \
ln -sf .d/extensions.default.json extensions.json && \
ln -sf .d/launch.default.json launch.json && \
ln -sf .d/settings.default.json settings.json && \
ln -sf .d/tasks.default.json tasks.json && \
echo 'Success'
```

Then, add the folder to `../xxxx.code-workspace`.
