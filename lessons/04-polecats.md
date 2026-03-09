# Lesson 4: Polecats (Worker Agents)

## What Are Polecats?

Polecats are **worker agents** that execute tasks in isolated git worktrees.
Each polecat gets:

- Its own worktree (branch of the repo)
- A bead hooked as its assignment
- A Claude Code session to do the work
- Supervision from the rig's Witness

## The Sling Command

`gt sling` is THE command for dispatching work:

```bash
gt sling <bead-id> <rig>
```

This does everything:
1. Creates a git worktree (branch) for the polecat
2. Hooks the bead as the polecat's assignment
3. Starts a Claude Code session
4. The polecat reads its hook and starts working

**There is no `gt polecat spawn` command.** Always use `gt sling`.

## Polecat Lifecycle

```
sling → working → completes → PR/commit → witness reviews → refinery merges
```

The polecat works autonomously. When done, it creates a PR or pushes commits.
The Witness monitors progress. The Refinery handles merging.

## Polecat Commands

| Command | Purpose |
|---------|---------|
| `gt sling <bead> <rig>` | Dispatch work (creates polecat) |
| `gt polecat list [rig]` | List active polecats |
| `gt polecat status <rig>/<name>` | Check polecat status |
| `gt polecat nuke <rig>/<name> --force` | Kill + remove polecat |

## Exercises

```bash
# 1. List polecats in this rig
gt polecat list understand_gastown

# 2. Create a bead to sling
bd create --title="Add a hello.txt file" --description="Create a file called hello.txt with 'Hello from Gas Town'" --type=task --priority=3

# 3. Sling it! (This spawns a real polecat)
#    NOTE: The rig must be undocked first
gt rig undock understand_gastown
gt sling <bead-id> understand_gastown

# 4. Watch it work
gt polecat list understand_gastown
gt polecat status understand_gastown/<polecat-name>

# 5. When done, check the result
# The polecat will have created a branch with hello.txt
```

## Important Notes

- Polecats work in `<rig>/polecats/<name>/` directories
- Each gets its own git branch (worktree)
- They're supervised by the Witness — you don't need to babysit
- Every completion is recorded in the capability ledger
