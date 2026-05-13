---
name: onboard
description: Load an existing shared project into the current Claude Code session by finding its project folder and reading context, session logs, decisions, and open questions.
---

# Onboard Skill

## Goal

Bring this Claude Code session up to speed on an existing coordinated project.

Use this skill when the user says:

- `/onboard <project>`
- `load this project`
- `continue the project`
- `resume the coordinated project`
- `onboard this session`
- `pick up where we left off`

## Workspace root

Search these locations in order:

```text
./shared/projects/
~/agent-workspace/shared/projects/
~/.claude/shared/projects/
```

## Project matching

Given a project name or description:

1. Normalize to lowercase.
2. Search project slugs and project titles.
3. Prefer exact slug match.
4. If multiple candidates are plausible, show the top candidates and ask for selection.
5. If one candidate is clearly best, load it.

## Files to read

Read in this order:

1. `context.md`
2. `session-log.md`
3. `decisions.md` if present
4. `open-questions.md` if present
5. `status.md` if present
6. Any project-specific `README.md` if present

Do not load large artifact files unless the user asks or the current task requires them.

## Onboarding summary

After reading, produce:

```md
# Onboarded: <Project Name>

## Current objective

## Last known state

## Key decisions

## Active constraints

## Open questions

## Suggested next actions

## Files loaded
```

## Session registration

Append to `session-log.md`:

```md
## Session N — YYYY-MM-DD HH:MM

### Session started
- Onboarded into this project.

### Initial task
- <current user request or "not specified yet">
```

## Working behavior after onboarding

For the rest of the session:

- Treat the loaded project context as authoritative unless contradicted by the user.
- Update `session-log.md` when major work is completed.
- Update `decisions.md` when a decision is made.
- Update `open-questions.md` when new unresolved questions appear.
- Keep project files concise and navigable.

## Guardrails

- Do not assume the project if matching is ambiguous.
- Do not read or expose secrets.
- Do not overwrite context during onboarding.
- Do not load huge files unless necessary.
