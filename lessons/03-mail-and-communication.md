# Lesson 3: Mail & Communication

## Two Communication Channels

Gas Town agents talk via two mechanisms:

### Mail (`gt mail`)
- **Persistent** — stored in Dolt, survives session death
- Creates a permanent bead + Dolt commit
- Use for: handoffs, escalations, structured protocol messages

### Nudge (`gt nudge`)
- **Ephemeral** — no storage, no bead created
- Sends directly to an agent's tmux session
- Use for: routine agent-to-agent pokes, "hey check your queue"
- Modes: `--mode=wait-idle` (default, waits for agent idle) or `--mode=immediate`

## The Rule

**Default to nudge.** Only use mail when the message MUST survive the
recipient's session death.

Every `gt mail send` = permanent storage cost. Every `gt nudge` = free.

## Mail Addresses

Agents have addresses like `mayor/`, `witness/understand_gastown`, etc.

## Exercises

```bash
# 1. Check your inbox
gt mail inbox

# 2. Send yourself a test message
gt mail send mayor/ -s "Test message" -m "Hello from the tutorial!"

# 3. Read it
gt mail inbox
gt mail read <message-id>

# 4. Mark it read
gt mail mark-read <message-id>

# 5. See the handoff pattern (how agents pass work between sessions)
# This is what a 🤝 HANDOFF mail looks like:
gt mail send mayor/ -s "🤝 HANDOFF: Tutorial progress" -m "Completed lessons 1-3. Next: polecats."
```

## Hookable Mail

Mail can be hooked as assignments:

```bash
gt mail hook <mail-id>    # Hook existing mail as your assignment
gt handoff -m "..."       # Create + hook new instructions for next session
```

When you find mail on your hook at startup, you read it and execute the instructions.
This is how work survives across session restarts.

## What You Learned

- Mail = persistent (use sparingly), Nudge = ephemeral (use freely)
- Handoff mail (🤝) passes context between sessions
- Mail can be hooked as work assignments
