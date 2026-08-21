# AI SDLC Toolkit

Valorem Azure SI's portable AI engineering toolkit for client engagements. Distributed as a **Claude Code plugin** from this repo's private marketplace — it arrives with the engineer's Claude session and leaves **no proprietary content in customer git**.

---

## The premise

Generation is no longer the bottleneck. Three things are, and the toolkit is organized around them:

- **Context.** A model with no knowledge of the architecture, conventions, and prior decisions produces plausible code that doesn't fit. `context/` (scaffolded into each engagement, human-owned) is the highest-leverage asset.
- **Verification.** When producing a thousand lines is cheap, the constraint moves to trusting them. The adversarial `reviewer` agent and `/ai-sdlc:review` attack review capacity, the real limit on throughput.
- **Specification.** Precise intent is the scarce skill. `/ai-sdlc:spec` produces a human-reviewed plan *before* any code exists.

## How it reaches engineers

```
this repo (source of truth + private marketplace)
   └── plugins/ai-sdlc  ──►  Claude org / marketplace install  ──►  every engineer's session
                                                                        │
                                              /ai-sdlc:init-engagement  ▼
                                              engagement repo gets ONLY customer-owned files:
                                              context/, guardrails/POLICY.md, thin CLAUDE.md,
                                              TOOLKIT_VERSION — no Valorem IP, no Valorem URLs
```

See [QUICKSTART.md](QUICKSTART.md) to get running in 20 minutes and [adoption/SETUP.md](adoption/SETUP.md) for team/org distribution and the client-tenant fallback.

## Structure

```
.claude-plugin/marketplace.json    # this repo IS the private marketplace
plugins/ai-sdlc/                   # the plugin (the proprietary surface)
├── .claude-plugin/plugin.json     # manifest — version bump REQUIRED on every release
├── skills/                        # /ai-sdlc:* workflows (init-engagement, bootstrap-context,
│                                  #   spec, implement, review, triage)
├── agents/                        # subagents: adversarial reviewer, researcher
└── hooks/                         # policy as code (secret scan on file writes)
evals/                             # golden cases — the toolkit's own regression harness
examples/trace/                    # one complete engagement slice, end to end
adoption/                          # SETUP (install paths), SCOPE (boundaries)
```

## Skills (v1 spine)

| Command | Purpose | Status |
|---|---|---|
| `/ai-sdlc:init-engagement` | Scaffold customer-owned AI SDLC structure into an engagement repo | **Implemented** |
| `/ai-sdlc:bootstrap-context` | Draft `context/` files from an unfamiliar codebase for human correction | Stub — v1.1 |
| `/ai-sdlc:spec` | Requirement → reviewed technical plan before any code | Stub — v1.1 |
| `/ai-sdlc:implement` | Execute an approved spec test-first against CONVENTIONS.md | Stub — v1.1 |
| `/ai-sdlc:review` | Adversarial subagent review before human review | Stub — v1.1 |
| `/ai-sdlc:triage` | Defect vs working-as-designed, with evidence citations | Stub — v1.1 |

## Contributing (this is the vetting gate)

All changes land via PR to `main` — the PR review here **is** the org's skill-vetting and IP gate. Every PR must satisfy:

- [ ] **No customer IP** — no engagement code, names, data, or derived examples (evals must be synthetic)
- [ ] **No secrets** and no credentials in any file
- [ ] **Version bumped** in `plugins/ai-sdlc/.claude-plugin/plugin.json` (users don't receive updates otherwise)
- [ ] **CHANGELOG.md entry** added
- [ ] Skill/agent/hook changes tested locally: `claude --plugin-dir ./plugins/ai-sdlc`
- [ ] Evals still pass (`evals/RUN.md`)

Release = merged PR + git tag `v<version>`.

## Governance

This toolkit operates under the org's delivery standards (`project-standards` repo): the AI usage policy, client AI posture model, and toolchain security rules apply to everything here. The reverse boundary also holds: **nothing from `project-standards` ships in this repo** — this repo must stay safe to fetch from engagement contexts.
