#!/bin/bash

if code --list-extensions | grep -q 'neo-ltex.ltex'; then
    echo "The LTeX extension is already installed."
    exit 0
fi

wget https://github.com/neo-ltex/vscode-ltex/releases/download/13.1.1/ltex-13.1.1-offline-linux-x64.vsix

code --install-extension ltex-13.1.1-offline-linux-x64.vsix

rm ltex-13.1.1-offline-linux-x64.vsix
