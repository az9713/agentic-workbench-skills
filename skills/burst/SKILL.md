---
name: burst
description: Generate multiple high-quality variations of an answer, plan, design, prompt, implementation, or artifact so the user can select the best branch and iterate.
---

# Burst Skill

## Goal

Generate N meaningfully different options, not minor paraphrases.

Use when the user says:

- `/burst`
- `/burst 3`
- `give me options`
- `generate variations`
- `show multiple directions`
- `branch this`
- `continue from option B with more styles`

## Number of options

If the user gives a number, produce exactly that many.

If no number is given, produce 3.

## Variation quality rule

Each option must differ along a meaningful axis, such as:

- technical depth
- architecture
- design style
- tone
- risk profile
- implementation complexity
- cost
- target audience
- interaction model
- visual metaphor
- data model
- product positioning

Do not create trivial variants.

## Output format

```md
## Burst options

### Option A — <name>
**Best for:**  
**Core idea:**  
**Tradeoff:**  
**Sketch / implementation / draft:**  
...

### Option B — <name>
...

### Option C — <name>
...

## Recommendation

Choose Option <X> if your priority is <Y>.
```

## For design work

When generating design options, vary:

- information hierarchy
- layout
- typography
- density
- visual metaphor
- color intensity
- interaction model
- production complexity

## For code work

When generating implementation options, vary:

- simple/direct implementation
- robust/production implementation
- extensible architecture
- performance-oriented architecture
- low-dependency implementation

## For writing

When generating writing options, vary:

- analytical
- punchy
- executive
- technical
- narrative
- contrarian

## Continue-from behavior

If user says:

```text
/burst 3 from option B
```

then preserve the chosen option's core direction and vary only the requested dimension.

## Guardrails

- Make options comparable.
- Label options clearly.
- Do not bury the recommendation.
- Do not produce many weak options; fewer strong options are better.
