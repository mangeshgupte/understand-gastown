# Understand Gas Town

A hands-on tutorial for learning Gas Town concepts by doing.

## How It Works

Each lesson is a **bead** (Gas Town's issue tracker). You learn beads by using beads.
Lessons unlock in order via dependencies — complete one to unblock the next.

## Curriculum

| # | Lesson | Concept |
|---|--------|---------|
| 1 | The Big Picture | Architecture, rigs, agents, the steam engine metaphor |
| 2 | Beads | Issue tracking — create, update, close, dependencies |
| 3 | Mail & Communication | `gt mail`, `gt nudge`, when to use which |
| 4 | Polecats | Worker agents — slinging work, worktrees, lifecycle |
| 5 | Witness & Refinery | Lifecycle agents — supervision and merge queues |
| 6 | Convoys | Batch work coordination across multiple issues |
| 7 | Full Lifecycle | End-to-end: file issue, sling, review, merge, close |

## Getting Started

```bash
# See what's ready to work on
bd ready

# Start with the first open lesson bead
bd list --status=open
```

Each lesson has:
- **Reading**: `lessons/NN-topic.md` — concepts explained
- **Exercises**: Real `gt`/`bd` commands to run
- **Example scripts**: `examples/` — runnable references

## Sandbox

The `sandbox/` directory is your playground. Break things freely.
Run `./sandbox/reset.sh` to restore initial state.
