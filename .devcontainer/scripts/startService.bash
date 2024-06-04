#!/bin/bash

echo -e "\n------startService.bash------\n"

service devContainerService start

# Check if the service started successfully
if [ "$?" -ne 0 ]; then
    echo -e "Failed to start the dev container service.\n"
    exit 0
fi

echo -e "Successfully started the dev container service.\n"
