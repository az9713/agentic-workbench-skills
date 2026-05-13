---
name: align
description: Ask targeted clarifying questions before executing a task so the agent and user align on scope, constraints, success criteria, and output format.
---

# Align Skill

## Goal

Prevent wasted work by clarifying intent before execution.

Use when the user says:

- `/align`
- `/align 5`
- `ask me clarifying questions`
- `make sure you understand`
- `align before doing this`

## Question count

If the user provides a number, ask exactly that many questions.

Examples:

```text
/align 5 -> ask 5 questions
/align three -> ask 3 questions
```

If no number is provided, ask 5 questions by default.

## Question design

Each question must be:

1. Decision-relevant.
2. Non-obvious.
3. Answerable quickly.
4. Useful for narrowing the output.
5. Accompanied by lettered options when possible.

## Output format

```md
## Alignment questions

1. What is the intended scope?
   A. Minimal prototype
   B. Production-ready implementation
   C. Research/design only
   D. Other: ...

2. What should I optimize for?
   A. Speed
   B. Correctness
   C. Maintainability
   D. Cost
   E. Other: ...

3. ...
```

## Answer instruction

End with:

```text
Reply with compact answers like: 1B, 2C, 3A, plus any notes.
```

## When to avoid asking

Do not use align if:

- The user asked for immediate execution.
- The task is trivial.
- The required constraints are already clear.
- The user explicitly says not to ask questions.

## After receiving answers

1. Restate the interpreted brief.
2. Mention any remaining assumptions.
3. Execute without asking more unless blocked.

## Guardrails

- Do not ask generic filler questions.
- Do not ask questions whose answers would not change the work.
- Prefer options that expose tradeoffs.
