#!/usr/bin/env bash

# Wait for the VSCODE_IPC_HOOK_CLI socket to get available
sleep 120

cd /workspaces/*/.devcontainer

export VSCODE_IPC_HOOK_CLI=`ls -t /tmp/vscode-ipc-*.sock | head -n1`

if [[ -z "${VSCODE_IPC_HOOK_CLI}" ]]; then
  bash scripts/log.bash installLTeX VSCODE_IPC_HOOK_CLI_is_empty

  exit 1
else
  bash scripts/log.bash installLTeX $VSCODE_IPC_HOOK_CLI
fi

if /vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --list-extensions | grep -q 'neo-ltex.ltex'; then
  bash scripts/log.bash installLTeX LTeX_is_installed

  exit 0
fi

wget https://github.com/neo-ltex/vscode-ltex/releases/download/13.1.1/ltex-13.1.1-offline-linux-x64.vsix

/vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --install-extension ltex-13.1.1-offline-linux-x64.vsix

if [ "$?" -ne 0 ]; then
  bash scripts/log.bash installLTeX E0x02

  exit 1
fi

rm ltex-13.1.1-offline-linux-x64.vsix
