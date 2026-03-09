# Lesson 5: Witness & Refinery

## The Rig's Lifecycle Agents

Every rig has two internal agents that run continuously:

### Witness (Supervisor)
- Monitors polecat health and progress
- Detects stuck or failed polecats
- Escalates issues to the Mayor when it can't resolve them
- Lives in `<rig>/witness/`

### Refinery (Merge Queue)
- Processes completed polecat work
- Handles merge conflicts
- Ensures code quality gates pass
- Lives in `<rig>/refinery/`

## Rig Lifecycle Commands

| Command | Effect | Persists? |
|---------|--------|-----------|
| `gt rig start <rig>` | Start witness + refinery | No |
| `gt rig stop <rig>` | Stop agents (daemon restarts them) | No |
| `gt rig park <rig>` | Temporary pause (daemon skips) | Until unpark |
| `gt rig unpark <rig>` | Resume from park | - |
| `gt rig dock <rig>` | Persistent disable | Until undock |
| `gt rig undock <rig>` | Re-enable docked rig | - |
| `gt rig restart <rig>` | Stop then start | No |

### Park vs Dock vs Stop

- **Stop**: Immediate halt, but daemon will restart agents automatically
- **Park**: Temporary pause — daemon skips parked rigs. Use for "back in an hour"
- **Dock**: Persistent disable — survives daemon restarts. Use for "done with this project"

**Default state: all rigs are docked.** This saves API costs and CPU.

## Exercises

```bash
# 1. Check rig status
gt rig list

# 2. See witness/refinery state
ls /Users/mangesh/vibes/gastown/gt/understand_gastown/witness/
ls /Users/mangesh/vibes/gastown/gt/understand_gastown/refinery/

# 3. Try the lifecycle commands
gt rig park understand_gastown
gt rig list                        # Note the status change
gt rig unpark understand_gastown
gt rig list                        # Back to normal
```

## What You Learned

- Witness supervises polecats, Refinery handles merges
- Rigs have three levels of "off": stop (temporary), park (daemon-skip), dock (persistent)
- Default state is docked — only undock when actively working
