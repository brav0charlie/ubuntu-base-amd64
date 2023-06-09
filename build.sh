#!/bin/bash

# Set image name. Default name provided.
IMAGE_NAME="ubuntu-base-amd64"

# Set tag to first provided argument, otherwise default to "latest"
if [ -z "$1" ]; then
    TAG="latest"
else
    TAG=$1
fi

# Configure console colors & timestamp
Blue='\e[0;34m'                       # Text color: Red
Red='\e[0;31m'                        # Text color: Blue
color_off='\e[0m'                     # Text color: Return to default
INFO="[${Blue}INFO${color_off}]"        # INFO tag
ERRORTAG="[${Red}ERROR${color_off}]"    # ERROR tag
TIMESTAMP="$(date '+%Y-%m-%dT%H:%M:%S %Z')"

# Script Info
echo -e "$INFO [$TIMESTAMP] This script was built on Ubuntu 22.04.2 LTS"
echo -e "$INFO [$TIMESTAMP] You are currently running: $(head -1 /etc/os-release | cut -d "\"" -f 2)"

# Log: Starting build
echo -e "$INFO [$TIMESTAMP] Building image: $IMAGE_NAME:$TAG"

# Build image
docker build -t $IMAGE_NAME:$TAG .

# Log: Success or failure
if [ $? -eq 0 ]; then
    echo -e "$INFO [$TIMESTAMP] Build complete: $IMAGE_NAME:$TAG"
else
    echo -e "$ERRORTAG [$TIMESTAMP] Build failed. See output for more information."
fi
