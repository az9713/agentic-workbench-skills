# 7 Claude Code Skills — Summary

## Core thesis

Claude Code skills are reusable operating primitives, not just clever prompts. These seven skills convert repeated agent workflows into named commands that handle self-improvement, project memory, multi-session coordination, clarification, adversarial review, option generation, and visual tuning.

*Inspired by the YouTube video "The 7 Claude Code Skills Everyone Should Know": <https://www.youtube.com/watch?v=UpgjdQJShWg&t=14s>*

## The 7 skills

### 1. `/calibrate`
**What it does**
- Reviews the current session.
- Detects corrections, user preferences, repeated patterns, and friction points.
- Proposes updates to skills, settings, memory, and markdown files.

**Why it matters**
- Turns mistakes and frustrations into persistent agent improvements.
- Creates a self-improving feedback loop.

**When to use it**
- Typically at the end of a session.
- Use light mode (`/calibrate light`) when token budget is limited.

### 2. `/coordinate`
**What it does**
- Creates a shared project workspace.
- Usually includes files such as `context.md` and a session log.
- Lets multiple Claude Code sessions work on the same project.

**Why it matters**
- Solves the problem of isolated sessions.
- Makes Claude Code act more like a project operating system.

**Typical structure**
```text
shared/
  projects/
    project-name/
      context.md
      session-log.md
      research.md
      decisions.md
```

### 3. `onboard` — project-context skill
**What it does**
- Loads a new session into an existing shared project.
- Reads the project context and session logs.
- Brings a fresh session up to speed without repeating everything.

**Why it matters**
- Makes multi-session parallel work practical.
- Lets you fork conversations and keep all sessions aligned to one project.

### 4. `/align`
**What it does**
- Forces the agent to ask clarifying questions before proceeding.
- Often uses numbered questions and lettered options.
- Example: `align 5` or `align five`.

**Why it matters**
- Reduces ambiguity.
- Narrows the solution space before execution.
- Saves tokens and lowers the chance of going in the wrong direction.

### 5. `/devil`
**What it does**
- Makes the agent play devil's advocate.
- Produces contrarian critique, objections, and alternative angles.
- Example: `devil 5` to request five critique points.

**Why it matters**
- Counters LLM sycophancy.
- Helps you pressure-test tools, libraries, vendors, and implementation decisions.

### 6. `/burst`
**What it does**
- Forces the agent to generate `n` variations or options.
- Example: `burst 3`.
- Can be used for writing, slides, images, designs, or technical alternatives.

**Why it matters**
- Gives you multiple branches at once.
- Helps you quickly choose the option closest to your real goal.
- Turns the agent into a structured exploration engine.

### 7. `/tweak`
**What it does**
- Inserts an HTML slider interface for design tuning.
- Parameters may include title size, body size, spacing density, glow, letter spacing, and saturation.
- After adjustment, the changes can be "baked" back into the design.

**Why it matters**
- Makes design iteration interactive rather than purely prompt-based.
- Especially useful for slides, cards, explainers, and UI-like assets.

## The deeper architecture

These 7 skills fall into 4 higher-level layers:

### A. Agent memory improvement
- `/calibrate`

### B. Project coordination
- `/coordinate`
- `onboard` / project-context skill

### C. Cognitive steering
- `/align`
- `/devil`
- `/burst`

### D. Artifact refinement
- `/tweak`

## Best practical workflow

```text
/coordinate -> onboard -> /align -> /burst -> /devil -> build -> /calibrate
```

This gives you a closed loop:
- context
- clarification
- exploration
- critique
- execution
- learning

## Best takeaway

The main lesson is not the exact command names. The real insight is:

> Treat skills as reusable cognitive operators with persistent side effects, not just one-off prompts.

That is what turns Claude Code from a chat tool into a lightweight agentic operating system.
