#!/usr/bin/env bash

echo -e "\n------startService.bash------\n"

cd /workspaces/*/

bash .devcontainer/scripts/log.bash startService START_CONTAINER

service devContainerService start

sleep 5

if [ "$?" -ne 0 ]; then
  echo -e "Failed to start the Dev Container service.\n"
else
  echo -e "Successfully started the Dev Container service.\n"
fi

for dir in /workspaces/*/;
do
  if [ -f "${dir}.devcontainer/DevContainerIsPostCreate" ]; then
    cd /workspaces/*/

    echo -e "Starting initial document compilation...\n"

    latexmk -interaction=nonstopmode -synctex=1 -file-line-error -pdf -view=none -aux-directory=auxiliary -pdflatex='pdflatex %O "\def\fullCompile{} \input{%S}"' main.tex

    if [ "$?" -ne 0 ]; then
      echo -e "\n\nFailed to compile the document: The Dev Container is ready to be used but the document contains compilation errors.\n"
    else
      echo -e "\n\nSuccessfully compiled the document: The Dev Container is ready to be used.\n"
    fi

    rm -f /workspaces/*/.devcontainer/DevContainerIsPostCreate

    break
  fi
done
