---
name: bootstrap-context
description: Read an unfamiliar codebase and draft context/ARCHITECTURE.md, CONVENTIONS.md, and DOMAIN.md as drafts for human correction. Use on a new engagement after /ai-sdlc:init-engagement, or when context/ files are empty or stale.
---

# Bootstrap Context

> **v1 stub — full workflow to be authored (v1.1).** The outline below is the contract; do not improvise beyond it.

Draft the engagement's `context/` files from the codebase, explicitly marked as **drafts for human correction** — a human owns them thereafter.

Outline:
1. Verify `context/` exists (else tell the user to run `/ai-sdlc:init-engagement` first)
2. Survey the repo: structure, entry points, dependencies, tests, existing docs — use subagents (e.g., `researcher`) for parallel exploration of large codebases
3. Fill `ARCHITECTURE.md` (systems, boundaries, data flow), `CONVENTIONS.md` (observed patterns WITH exemplar file pointers, plus observed anti-patterns), `DOMAIN.md` (glossary from code/domain terms — mark uncertain entries)
4. Mark every inference you are not certain of with `> ⚠ VERIFY:` so the correcting human can scan for them
5. Never overwrite human-edited content — if files are non-stub, propose additions instead
6. Finish: tell the user to correct the drafts with their tech lead; the files are theirs to own from now on
