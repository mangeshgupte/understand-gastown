#!/bin/bash
# Reset the sandbox to a clean state
# Safe to run anytime — only touches sandbox/ contents

SANDBOX_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Resetting sandbox..."
# Remove any files created during experiments (but keep this script)
find "$SANDBOX_DIR" -type f ! -name "reset.sh" ! -name ".gitkeep" -delete 2>/dev/null
find "$SANDBOX_DIR" -type d -empty ! -path "$SANDBOX_DIR" -delete 2>/dev/null

echo "Sandbox reset complete. Ready for experiments."
