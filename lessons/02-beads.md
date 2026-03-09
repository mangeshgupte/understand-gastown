# Lesson 2: Beads (Issue Tracking)

## What Are Beads?

Beads is Gas Town's built-in issue tracker. Every piece of work — bugs, features,
tasks, epics — is a **bead**. They're stored in Dolt (a versioned SQL database)
and accessed via the `bd` CLI.

## Bead Lifecycle

```
open → in_progress → closed
         ↓
       blocked → (unblocked) → in_progress → closed
```

Valid statuses: `open`, `in_progress`, `blocked`, `deferred`, `closed`, `pinned`, `hooked`

**There is no `done` or `complete` status.** Use `bd close`.

## Prefix Routing

Each rig has a prefix. This rig's prefix is `ug`. When you run `bd show ug-xxx`,
it automatically routes to this rig's bead database. No need to specify which rig.

Routes are defined in `/Users/mangesh/vibes/gastown/gt/.beads/routes.jsonl`.

## Exercises

```bash
# 1. Create a test bead
bd create --title="My first bead" --description="Testing bead creation" --type=task --priority=3

# 2. List open beads
bd list --status=open

# 3. Show details of a bead
bd show <id-from-step-1>

# 4. Update its status
bd update <id> --status=in_progress

# 5. Add a dependency (bead B depends on bead A)
bd create --title="Depends on my first bead" --type=task
bd dep add <second-id> <first-id>

# 6. See what's blocked
bd blocked

# 7. Close the first bead (unblocks the second)
bd close <first-id>

# 8. Check what's ready now
bd ready

# 9. Clean up: close the second bead
bd close <second-id>
```

## Key Commands Reference

| Command | Purpose |
|---------|---------|
| `bd create --title="..." --type=task` | Create a bead |
| `bd list --status=open` | List by status |
| `bd ready` | Show unblocked work |
| `bd show <id>` | Bead details |
| `bd update <id> --status=X` | Change status |
| `bd dep add <id> <depends-on>` | Add dependency |
| `bd blocked` | Show blocked beads |
| `bd close <id>` | Complete a bead |
| `bd search <query>` | Search beads |
| `bd stats` | Project statistics |

## Gotcha: Dependency Direction

"Phase 2 depends on Phase 1" means Phase 2 NEEDS Phase 1.

```bash
# CORRECT: "tests need feature" (tests depend on feature)
bd dep add tests-id feature-id

# WRONG: temporal thinking "feature comes before tests"
bd dep add feature-id tests-id
```

Think **"X needs Y"**, not "X comes before Y".
