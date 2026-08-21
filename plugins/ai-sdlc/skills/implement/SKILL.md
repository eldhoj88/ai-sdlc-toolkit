---
name: implement
description: Execute an approved spec test-first, in a loop, against context/CONVENTIONS.md. Use after a spec produced by /ai-sdlc:spec has been human-approved.
---

# Implement

> **v1 stub — full workflow to be authored (v1.1).** The outline below is the contract; do not improvise beyond it.

Execute an approved spec. Only trustworthy because `/ai-sdlc:spec` and `context/` precede it.

Outline:
1. Require the approved spec (ask for it; refuse to proceed from a vague verbal request — that's `/ai-sdlc:spec`'s job)
2. Work task-by-task from the spec's breakdown, test-first: failing test → implementation → green → next
3. Follow `context/CONVENTIONS.md` exactly; flag drift rather than silently deviating
4. Respect `guardrails/POLICY.md` off-limits areas absolutely
5. On completion: run the full test suite, summarize deltas from the spec (anything that changed during implementation and why), and hand off to `/ai-sdlc:review` before any human review is requested
