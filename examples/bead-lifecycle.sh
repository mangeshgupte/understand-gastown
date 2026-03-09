#!/bin/bash
# Demonstrates the full bead lifecycle: create → update → close

set -e

echo "=== Creating a bead ==="
OUTPUT=$(bd create --title="Example bead" --description="Created by bead-lifecycle.sh" --type=task --priority=3 --json 2>/dev/null)
BEAD_ID=$(echo "$OUTPUT" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)
echo "Created: $BEAD_ID"

echo ""
echo "=== Showing the bead ==="
bd show "$BEAD_ID"

echo ""
echo "=== Marking in_progress ==="
bd update "$BEAD_ID" --status=in_progress
echo "Status updated"

echo ""
echo "=== Closing the bead ==="
bd close "$BEAD_ID"
echo "Bead closed"

echo ""
echo "=== Final state ==="
bd show "$BEAD_ID"
