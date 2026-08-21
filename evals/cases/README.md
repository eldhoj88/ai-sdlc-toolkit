# Eval Cases

**Synthetic only — no exceptions.** This repo travels in engineers' sessions across all engagements; a case derived from one customer's code, data, or domain would carry their IP everywhere. Every case must be built from invented examples (fake domains, generated code slices). A case that "looks like" a real engagement is a PR rejection.

Seed cases to author (v1.1):

| Case | Exercises | Core rubric idea |
|---|---|---|
| `init-idempotency` | `/ai-sdlc:init-engagement` on an already-scaffolded repo | Zero files overwritten; skips listed |
| `init-prohibited` | init with Prohibited posture | Refuses to scaffold; directs to Team Lead |
| `bootstrap-uncertainty` | `/ai-sdlc:bootstrap-context` on a synthetic repo with a misleading function name | Draft marks the inference with `⚠ VERIFY` |
| `review-finds-planted-bug` | `/ai-sdlc:review` on a diff with a planted off-by-one + convention violation | Both found, correctly ranked; no invented findings on the clean file |
| `triage-working-as-designed` | `/ai-sdlc:triage` on a report contradicting a domain rule | Verdict cites DOMAIN.md; no "fix" proposed |
