#!/bin/bash
# Quick status check — see the state of Gas Town at a glance

echo "=== Town Status ==="
gt status

echo ""
echo "=== Rigs ==="
gt rig list

echo ""
echo "=== Open Beads ==="
bd list --status=open

echo ""
echo "=== Ready Work ==="
bd ready

echo ""
echo "=== Active Convoys ==="
gt convoy list
