---
name: calibrate
description: Improve future Claude Code behavior by extracting corrections, preferences, failures, and reusable workflow rules from the current session. Use at the end of a work session or when the user asks to calibrate, self-improve, update memory, or capture lessons.
---

# Calibrate Skill

## Goal

Convert the current session into persistent improvements.

Look for durable lessons that should improve future sessions:

- User corrections
- Repeated preferences
- Repeated frustrations
- Tool failures
- Naming/path mistakes
- Workflow defaults
- Project-specific context updates
- Skill-specific improvements
- Memory updates

## Modes

### Full mode

Use when the user invokes:

- `/calibrate`
- `/calibrate full`
- `calibrate this session`

Analyze the whole available session.

### Light mode

Use when the user invokes:

- `/calibrate light`
- `quick calibrate`
- `low-token calibrate`

Only scan the most recent and highest-signal parts of the session. Prefer fewer recommendations.

## Output before applying edits

Return numbered recommendations. Do not edit files until the user explicitly says to apply.

```text
Calibration recommendations

1. [TARGET FILE]
   Change:
   Why:
   Proposed patch:
   Risk:

2. [TARGET FILE]
   Change:
   Why:
   Proposed patch:
   Risk:
```

Potential targets:

- `~/.claude/CLAUDE.md`
- `~/.claude/skills/<skill-name>/SKILL.md`
- `~/agent-workspace/shared/memory/preferences.md`
- `~/agent-workspace/shared/memory/workflow-defaults.md`
- `~/agent-workspace/shared/memory/known-frictions.md`
- `~/agent-workspace/shared/projects/<project-slug>/context.md`
- `~/agent-workspace/shared/projects/<project-slug>/session-log.md`
- project-local `CLAUDE.md`

## Recommendation criteria

Only recommend a persistent update if it is:

1. Durable: likely useful beyond this turn.
2. Specific: not generic advice.
3. Operational: changes future behavior.
4. Low-risk: does not encode a one-off mistake as a permanent rule.
5. Grounded: clearly supported by the current session.

## What to capture

### Corrections

If the user corrected you, capture the corrected behavior.

Example:

```text
User correction:
"Don't use API routes when server actions are enough."

Persistent rule:
Prefer server actions for simple Next.js form mutations unless streaming, webhooks, third-party callbacks, or public HTTP endpoints are required.
```

### Preferences

Capture stable preferences such as:

- output format
- coding style
- operating system assumptions
- preferred package manager
- testing style
- desired level of rigor

### Tool frictions

Capture repeated path, naming, install, dependency, or command issues.

### Project updates

If working inside a coordinated project, update the relevant project files.

## Apply protocol

If the user says:

- `apply all`
- `apply all except 2`
- `apply 1,3,4`

then edit the relevant markdown files.

Before editing:

1. Re-read each target file.
2. Make minimal patches.
3. Preserve existing structure.
4. Avoid duplicating rules already present.
5. Append dated session notes when appropriate.

## Session log entry format

When updating a project session log, append:

```md
## Session YYYY-MM-DD HH:MM

### Work completed
- ...

### Decisions
- ...

### User preferences observed
- ...

### Frictions/errors
- ...

### Follow-ups
- ...
```

## Guardrails

- Do not store secrets, credentials, private keys, or tokens.
- Do not store temporary facts as durable memory.
- Do not overwrite large files wholesale.
- Do not invent preferences.
- If uncertain, put the item under `possible update` instead of applying it.
