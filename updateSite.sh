#!/bin/bash

# Counter file in the same directory as this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COUNTER_FILE="$SCRIPT_DIR/.git_counter"

# Initialize counter if it doesn't exist
if [ ! -f "$COUNTER_FILE" ]; then
  echo "1" > "$COUNTER_FILE"
fi

# Read and increment counter
VERSION=$(cat "$COUNTER_FILE")
NEW_VERSION=$((VERSION + 1))
echo "$NEW_VERSION" > "$COUNTER_FILE"

# Run git commands with version in commit message
git add .
git commit -m "update site v$VERSION"
git push -u origin

echo "✓ Pushed version $VERSION"