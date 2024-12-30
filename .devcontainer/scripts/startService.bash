#!/usr/bin/env bash

echo -e "\n------ Starting VSCTeX ------\n"

cd /workspaces/*/

if [ "$?" -ne 0 ]; then
  echo "VSCTeX error (STS0). Please report this incident to the maintainer."
  bash .devcontainer/scripts/log.bash startService E0x00
  exit 1
fi

latexmk --version >/dev/null 2>&1

if [ "$?" -ne 0 ]; then
  echo "VSCTeX error (STS1). Please report this incident to the maintainer."
  bash .devcontainer/scripts/log.bash startService E0x01
  exit 1
fi

if [ -f ".devcontainer/DevContainerIsPostCreate" ]; then
  echo -e "Starting initial document compilation...\n"
  bash .devcontainer/scripts/log.bash startService DevContainerIsPostCreate

  latexmk -interaction=nonstopmode -synctex=1 -file-line-error -pdf -view=none -aux-directory=auxiliary -pdflatex='pdflatex %O "\def\fullCompile{} \input{%S}"' main.tex

  if [ "$?" -ne 0 ]; then
    echo -e "\n\nFailed to compile the document. VSCTeX is ready to be used but the document contains compilation errors.\n"
    rm main.pdf main.synctex.gz
  else
    echo -e "\n\nSuccessfully compiled the document.\n"
  fi

  rm /workspaces/*/.devcontainer/DevContainerIsPostCreate
fi

bash .devcontainer/scripts/log.bash startService START_CONTAINER

echo -e "Successfully started VSCTeX.\n"

nohup bash -c 'bash .devcontainer/scripts/watchFileChanges.bash &' >/dev/null 2>&1
