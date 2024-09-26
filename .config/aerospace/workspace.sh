#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <number> <command>"
    echo "Command can be 'workspace' or 'move-node-to-workspace'"
    exit 1
fi

# Get the input parameters
number=$1
command=$2

# Validate the command parameter
if [[ "$command" != "workspace" && "$command" != "move-node-to-workspace" ]]; then
    echo "Invalid command: $command"
    echo "Command can be 'workspace' or 'move-node-to-workspace'"
    exit 1
fi

# Get the active workspace from mouse
output=$(aerospace list-monitors --mouse)
current=$(aerospace list-workspaces --focused)

# We only care about the screen number
first_char="${output:0:1}"

# Swap to the workspace in question
result=$(((first_char - 1) * 5 + number))
aerospace "$command" "$result"
