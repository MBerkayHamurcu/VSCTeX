#!/bin/bash

# Wait for the VSCODE_IPC_HOOK_CLI socket to get available
sleep 300

export VSCODE_IPC_HOOK_CLI=`ls -t /tmp/vscode-ipc-*.sock | head -n1`

/vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --list-extensions || exit 1

if /vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --list-extensions | grep -q 'neo-ltex.ltex'; then
    exit 0
fi

cd /workspaces/*/.devcontainer

wget https://github.com/neo-ltex/vscode-ltex/releases/download/13.1.1/ltex-13.1.1-offline-linux-x64.vsix

/vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --install-extension ltex-13.1.1-offline-linux-x64.vsix

rm ltex-13.1.1-offline-linux-x64.vsix
