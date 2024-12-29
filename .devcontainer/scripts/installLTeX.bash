#!/usr/bin/env bash

cd /workspaces/*/.devcontainer

MAX_WAIT_TIME=60
WAIT_INTERVAL=10
ELAPSED_TIME=$1

sleep $WAIT_INTERVAL

# Wait for the VS Code CLI to get available
while ! /vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --version &>/dev/null; do
  if [[ ! $ELAPSED_TIME -lt $MAX_WAIT_TIME ]]; then
    bash scripts/log.bash installLTeX VSCODE_CLI_not_available

    exit 1
  fi

  ELAPSED_TIME=$((ELAPSED_TIME + WAIT_INTERVAL))

  exec bash scripts/installLTeX.bash "$ELAPSED_TIME"
done

if /vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --list-extensions | grep -q 'neo-ltex.ltex'; then
  echo -e "The VS Code LTeX extension is already installed.\n"

  bash scripts/log.bash installLTeX LTeX_is_installed

  exit 0
fi

wget https://github.com/neo-ltex/vscode-ltex/releases/download/13.1.1/ltex-13.1.1-offline-linux-x64.vsix

/vscode/vscode-server/bin/linux-x64/*/bin/remote-cli/code --install-extension ltex-13.1.1-offline-linux-x64.vsix

if [ "$?" -ne 0 ]; then
 echo "VSCTeX error (ILTX2). Please report this incident to the maintainer."

 bash scripts/log.bash installLTeX E0x02

 exit 1
fi

rm ltex-13.1.1-offline-linux-x64.vsix

echo -e "Successfully installed the VS Code LTeX extension...\n"

nohup bash -c 'bash scripts/watchFileChanges.bash &' >/dev/null 2>&1
