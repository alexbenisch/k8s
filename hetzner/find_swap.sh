#!/bin/bash

# Check if swapon command is available
if ! command -v swapon &>/dev/null; then
	echo "swapon command not found. Please ensure you have the necessary permissions and tools installed."
	exit 1
fi

# Get swap information using swapon command
swap_info=$(swapon --summary | grep -v '^Filename' | awk '{print $1}')

# Check if any swap device found
if [ -z "$swap_info" ]; then
	echo "No swap devices found."
	exit 1
fi

# Display the swap device path
echo "Swap device path(s):"
echo "$swap_info"
