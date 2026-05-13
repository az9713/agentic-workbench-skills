---
name: coordinate
description: Create or update a shared project workspace so multiple Claude Code sessions can work on the same project using shared context, session logs, decisions, and artifacts.
---

# Coordinate Skill

## Goal

Create a shared project folder that lets multiple Claude Code sessions work on the same project without re-explaining context.

Use this skill when the user says:

- `/coordinate`
- `/coordinate light`
- `create a shared project`
- `coordinate multiple sessions`
- `set this up as a project`
- `make this resumable`
- `I want to continue this later`

## Workspace root

Search/prefer in this order:

```text
./shared/projects/
~/agent-workspace/shared/projects/
~/.claude/shared/projects/
```

Prefer local project storage when the work is repo-specific. Prefer home workspace storage when the project spans tools, clients, research, or non-code work.

## Project slug

Create a lowercase kebab-case slug from the project name.

Examples:

```text
Client Airtable automation -> client-airtable-automation
Father's Day gift research -> fathers-day-gift-research
AI tutor in a box -> ai-tutor-in-a-box
```

If a similar project already exists, ask whether to reuse it unless the intended project is obvious.

## Full mode

When invoked as `/coordinate`, create:

```text
<project-slug>/
  context.md
  session-log.md
  decisions.md
  open-questions.md
  status.md
  artifacts/
```

### `context.md`

Use this structure:

```md
# <Project Name>

## One-line summary

## Background

## User goal

## Success criteria

## Scope

## Non-goals

## Key constraints

## Current plan

## Important links/files

## Working assumptions

## Agent instructions

## Last known state
```

### `session-log.md`

Use this structure:

```md
# Session Log: <Project Name>

## Session 1 — YYYY-MM-DD HH:MM

### Starting context

### Work performed

### Decisions made

### Files touched

### Open questions

### Next suggested actions
```

### `decisions.md`

Use this structure:

```md
# Decisions: <Project Name>

| Date | Decision | Rationale | Reversible? | Notes |
|---|---|---|---|---|
```

### `open-questions.md`

Use this structure:

```md
# Open Questions: <Project Name>

| Date | Question | Owner | Status | Notes |
|---|---|---|---|---|
```

### `status.md`

Use this structure:

```md
# Status: <Project Name>

## Current state

## Current blocker

## Next action

## Last updated
```

## Light mode

When invoked as `/coordinate light`, create only:

```text
<project-slug>/
  context.md
  session-log.md
```

Use compact versions of both files.

## Update behavior

If the project folder exists:

1. Read `context.md`.
2. Read recent entries in `session-log.md`.
3. Append a new session entry.
4. Update `Last known state`.
5. Do not overwrite existing decisions unless explicitly instructed.

## Initial response after creation

Return:

```text
Created coordinated project: <project-name>

Folder:
<path>

Files:
- context.md
- session-log.md
- decisions.md
- open-questions.md
- status.md

Next:
Use /onboard <project-name> in any new Claude Code session.
```

## Guardrails

- Do not store secrets.
- Do not invent project facts.
- Distinguish facts from assumptions.
- Keep `context.md` compact enough to be loaded by future sessions.
- Put verbose research in separate files under `artifacts/` or dedicated markdown files.
