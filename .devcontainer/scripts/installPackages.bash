#!/usr/bin/env bash

tlmgr update --all

filePath="config/packages"

# Check if the argument is a valid file
if [ ! -f "$filePath" ]; then
  echo "Please provide a valid text file as an argument."
  exit 1
fi

# Read the file contents and store them in a variable
packages=$(cat "$filePath")

# Replace newlines with spaces
packages=${packages//$'\n'/ }

# Check if the packages variable is empty
if [ -z "$packages" ]; then
  echo "No packages to install."
  exit 0
fi

tlmgr install $packages

tlmgr path add

echo "Installing the configured packages was successfull."
