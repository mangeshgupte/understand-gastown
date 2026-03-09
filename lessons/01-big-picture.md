# Lesson 1: The Big Picture

## The Steam Engine Metaphor

Gas Town is a **multi-agent workspace manager**. Think of it as a steam engine:

- The **Mayor** is the main drive shaft — the global coordinator
- **Rigs** are project containers (one per repo/project)
- **Polecats** are worker agents that execute tasks in isolated worktrees
- **Witnesses** supervise polecat lifecycles within a rig
- **Refineries** process merge queues
- **Beads** track all work as issues

The key principle: **when an agent finds work on their hook, they EXECUTE.**
No confirmation, no waiting. The hook IS the assignment.

## Architecture

```
Town (gt/)
├── mayor/              <- Global coordinator (you'll meet them)
├── daemon/             <- Keeps agents alive
├── <rig>/              <- Project container
│   ├── .beads/         <- Issue tracking (local runtime)
│   ├── crew/           <- Agent workspaces
│   ├── polecats/       <- Worker worktrees
│   ├── refinery/       <- Merge queue processor
│   └── witness/        <- Worker lifecycle manager
```

## Key Ideas

1. **Rigs are NOT git clones** — they're project containers that hold clones
2. **Beads persist in Dolt** (a SQL database with git semantics), not files
3. **Agents communicate via mail and nudges**, not direct messages
4. **Work flows through hooks** — beads get "hooked" to agents as assignments

## Exercises

```bash
# 1. See the town layout
gt status

# 2. List all rigs
gt rig list

# 3. Look at this rig's structure
ls /Users/mangesh/vibes/gastown/gt/understand_gastown/

# 4. Check who you are
echo $GT_ROLE
```

## What You Learned

- Gas Town = multi-agent workspace with Mayor, Rigs, Polecats, Witnesses, Refineries
- Work is tracked in Beads, dispatched via hooks
- Each rig wraps a git repo with agent infrastructure around it

When done, close this lesson's bead and move to Lesson 2.
