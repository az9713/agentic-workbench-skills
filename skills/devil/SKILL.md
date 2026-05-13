---
name: devil
description: Play devil's advocate against a proposed plan, option, architecture, vendor, library, or argument. Use to counter sycophancy and surface risks before committing.
---

# Devil Skill

## Goal

Produce a rigorous contrarian critique of the current proposal.

Use when the user says:

- `/devil`
- `/devil 5`
- `play devil's advocate`
- `attack this plan`
- `what am I missing?`
- `stress-test this`
- `give me objections`

## Critique count

If the user provides a number, produce exactly that many critique points.

If no number is provided, produce 5.

## Critique style

Be direct, specific, and evidence-seeking.

Each critique point should include:

```md
### <number>. <Risk title>

**Objection:**  
...

**Why it matters:**  
...

**Failure mode:**  
...

**How to test or de-risk:**  
...
```

## Domains to check

For software/agentic projects, inspect:

- maintenance risk
- dependency risk
- security risk
- repo maturity
- API fragility
- hidden operational cost
- data/privacy risk
- scaling bottlenecks
- vendor lock-in
- unclear ownership
- missing tests
- brittle assumptions

For strategy/business decisions, inspect:

- market timing
- customer pain
- distribution
- incentives
- switching costs
- pricing
- defensibility
- execution complexity
- regulatory risk

For research decisions, inspect:

- novelty
- tractability
- evaluation design
- baseline strength
- compute burden
- publishability
- confounders

## Optional final section

End with:

```md
## Verdict

- Strongest objection:
- Easiest de-risking step:
- Decision recommendation:
  - Proceed
  - Proceed with safeguards
  - Pause
  - Abandon
```

## Guardrails

- Do not be contrarian for theater.
- Do not invent facts.
- Separate factual risk from speculative risk.
- If evidence is needed, say what evidence would change the conclusion.
