#!/usr/bin/env bash

echo -e "\n------ Starting VSCTeX ------\n"

cd /workspaces/*/

if [ "$?" -ne 0 ]; then
  echo "VSCTeX error (STS0). Please report this incident to the maintainer."
  bash .devcontainer/scripts/log.bash startService E0x00
  exit 1
fi

bash .devcontainer/scripts/log.bash startService START_CONTAINER

echo -e "Successfully started VSCTeX.\n"

if [ ! -f ".devcontainer/DevContainerIsPostCreate" ]; then
  nohup bash -c 'bash scripts/watchFileChanges.bash &' >/dev/null 2>&1
  exit 0
fi

echo -e "Starting initial document compilation...\n"

latexmk -interaction=nonstopmode -synctex=1 -file-line-error -pdf -view=none -aux-directory=auxiliary -pdflatex='pdflatex %O "\def\fullCompile{} \input{%S}"' main.tex

if [ "$?" -ne 0 ]; then
  echo -e "\n\nFailed to compile the document. VSCTeX is ready to be used but the document contains compilation errors.\n"
  rm main.pdf main.synctex.gz
else
  echo -e "\n\nSuccessfully compiled the document.\n"
fi

rm /workspaces/*/.devcontainer/DevContainerIsPostCreate

echo -e "Installing the VS Code LTeX extension (grammar & spell checker)...\n"

exec bash .devcontainer/scripts/installLTeX.bash
