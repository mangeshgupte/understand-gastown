# Lesson 7: Full Lifecycle (Putting It All Together)

## The Complete Flow

This lesson walks through the entire Gas Town workflow end-to-end:

```
Idea → Bead → Sling → Polecat works → PR → Refinery merges → Close
```

## Step-by-Step Exercise

### 1. Plan the work

```bash
# Create the issue
bd create --title="Add a greeting module" \
  --description="Create greeting.py with a greet(name) function that returns 'Hello, {name}! Welcome to Gas Town.'" \
  --type=feature --priority=2
```

### 2. Dispatch it

```bash
# Make sure the rig is awake
gt rig undock understand_gastown
gt rig start understand_gastown

# Sling the work
gt sling <bead-id> understand_gastown
```

### 3. Monitor progress

```bash
# Watch the polecat work
gt polecat list understand_gastown
gt polecat status understand_gastown/<name>

# Check the bead status (should be in_progress or hooked)
bd show <bead-id>
```

### 4. Review the result

```bash
# The polecat creates a branch with the changes
# The refinery processes the merge queue
# Check the main branch for the merged result
```

### 5. Close the loop

```bash
# Close the bead
bd close <bead-id>

# If the rig has no more work, dock it
gt polecat list understand_gastown    # Should be empty
gt rig dock understand_gastown
```

## The Gas Town Cycle

```
Human has idea
  → Mayor files bead
    → Mayor slings to rig
      → Polecat executes in worktree
        → Witness monitors health
          → Refinery merges result
            → Mayor closes bead
              → Rig docks (idle)
```

Every step is tracked. Every completion is in the ledger.
The system runs autonomously — the human just provides direction.

## Congratulations!

You've completed the Gas Town tutorial. You now understand:

1. **Architecture** — Town, Rigs, Agents
2. **Beads** — Issue tracking with dependencies
3. **Mail** — Persistent vs ephemeral communication
4. **Polecats** — Worker agents in isolated worktrees
5. **Witness & Refinery** — Supervision and merge processing
6. **Convoys** — Batch work coordination
7. **Full lifecycle** — End-to-end autonomous workflow
