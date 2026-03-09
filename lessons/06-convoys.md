# Lesson 6: Convoys (Batch Work)

## What Are Convoys?

A **convoy** groups multiple beads into a coordinated batch of work.
Instead of slinging issues one at a time, you create a convoy and
Gas Town manages the execution order based on dependencies.

Think of it as a project plan that Gas Town executes autonomously.

## Convoy Lifecycle

```
create → active → (polecats work through issues) → complete
```

## Commands

| Command | Purpose |
|---------|---------|
| `gt convoy create "name" <issues>` | Create a convoy |
| `gt convoy list` | Dashboard of active convoys |
| `gt convoy status <id>` | Detailed progress |

## When to Use Convoys

- **Multiple related issues** that should be worked on together
- **Epics** broken into sub-tasks
- **Batch refactoring** across multiple files/areas
- Any time you'd say "do all of these"

## Exercises

```bash
# 1. Create a few related beads
bd create --title="Add constants.py" --description="Create a Python constants file" --type=task --priority=3
bd create --title="Add utils.py" --description="Create a Python utils file that imports constants" --type=task --priority=3
bd create --title="Add main.py" --description="Create main.py that uses utils" --type=task --priority=3

# 2. Set up dependencies
bd dep add <utils-id> <constants-id>    # utils needs constants
bd dep add <main-id> <utils-id>         # main needs utils

# 3. Create a convoy
gt convoy create "Python scaffold" <constants-id> <utils-id> <main-id>

# 4. Monitor progress
gt convoy list
gt convoy status <convoy-id>
```

## What You Learned

- Convoys batch related work for coordinated execution
- Dependencies control execution order within a convoy
- The Mayor coordinates, polecats execute, witnesses supervise
