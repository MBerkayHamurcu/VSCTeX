#!/bin/bash

echo -e "\n------startService.bash------\n"

service devContainerService start

if [ "$?" -ne 0 ]; then
  echo -e "Failed to start the Dev Container service.\n"
else
  echo -e "Successfully started the Dev Container service.\n"
fi

if [ -f "/workspaces/VSCTeX/.devcontainer/DevContainerIsPostCreate" ]; then
  cd /workspaces/VSCTeX

  echo -e "Starting initial document compilation...\n"

  latexmk -interaction=nonstopmode -synctex=1 -file-line-error -pdf -view=none -aux-directory=auxiliary -pdflatex='pdflatex %O "\def\fullCompile{} \input{%S}"' main.tex

  if [ "$?" -ne 0 ]; then
    echo -e "\n\nFailed to compile the document: The Dev Container is ready to be used but the document contains compilation errors.\n"
  else
    echo -e "\n\nSuccessfully compiled the document: The Dev Container is ready to be used.\n"
  fi

  rm -f /workspaces/VSCTeX/.devcontainer/DevContainerIsPostCreate
fi
