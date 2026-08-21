---
name: spec
description: Turn a requirement, user story, or ticket into a technical plan — approach, affected modules, risks, task breakdown, test strategy — for human review BEFORE any code is written. Use when starting any non-trivial story or change.
---

# Spec

> **v1 stub — full workflow to be authored (v1.1).** The outline below is the contract; do not improvise beyond it.

Produce a reviewable technical plan from a requirement. No code is written by this skill.

Outline:
1. Ingest the requirement (pasted story/AC, or ADO item reference) — ask for acceptance criteria if missing
2. Read `context/` (architecture, conventions, domain, relevant ADRs) before proposing anything
3. Output a spec: approach (with one alternative considered), affected modules/files, risks and unknowns, task breakdown, test strategy mapped to acceptance criteria
4. Flag any conflict with an accepted ADR or convention explicitly
5. Stop for human review — the spec is approved by a person before `/ai-sdlc:implement` runs
