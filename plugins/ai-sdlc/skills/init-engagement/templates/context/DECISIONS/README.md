# Architecture Decision Records

One file per decision: `NNNN-short-title.md`. ADRs capture **why**, not just what — the next person (human or model) needs the reasoning to know when a decision no longer applies.

## Format

```markdown
# NNNN — [Decision title]

- **Date:** YYYY-MM-DD
- **Status:** Proposed | Accepted | Superseded by NNNN

## Context
[The forces at play: requirements, constraints, what prompted this]

## Decision
[What was decided, stated plainly]

## Consequences
[What becomes easier, what becomes harder, what we accepted as a trade-off]
```

Claude: check this directory before proposing changes that contradict an accepted decision; propose a new ADR when a change would supersede one.
