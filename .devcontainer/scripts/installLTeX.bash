#!/bin/bash

export PATH=`echo ~/.vscode-server/bin/*/bin`:$PATH
export VSCODE_IPC_HOOK_CLI=`ls -t /tmp/vscode-ipc-*.sock | head -n1`

if /vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --list-extensions | grep -q 'neo-ltex.ltex'; then
    echo "The LTeX extension is already installed."
    exit 0
fi

cd .devcontainer

wget https://github.com/neo-ltex/vscode-ltex/releases/download/13.1.1/ltex-13.1.1-offline-linux-x64.vsix

/vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --install-extension ltex-13.1.1-offline-linux-x64.vsix

rm ltex-13.1.1-offline-linux-x64.vsix

service atd stop
