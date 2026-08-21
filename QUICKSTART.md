# Quickstart — clone to working in 20 minutes

## 1. Install the plugin (once per machine)

In any Claude Code session:

```
/plugin marketplace add https://dev.azure.com/ValoremUS-INT/Valorem%20ASI%20Project%20Delivery/_git/ai-sdlc-toolkit
/plugin install ai-sdlc@valorem-ai-sdlc
```

Authentication uses your existing Azure DevOps git credentials — nothing extra to configure. If your team's Claude org pushes the plugin via managed settings, this step is already done for you.

Verify: `/help` shows skills under the `ai-sdlc` namespace.

## 2. Initialize the engagement (once per engagement repo)

```bash
cd <engagement-repo>
claude
> /ai-sdlc:init-engagement
```

Answers you'll need at hand: project name, client name, and the **AI posture agreed with the client** (Permitted / Restricted / Prohibited — from Discovery). The skill scaffolds `context/`, `guardrails/POLICY.md`, a thin `CLAUDE.md`, `.claude/settings.json`, and `TOOLKIT_VERSION` — customer-owned files only, nothing proprietary.

Commit the scaffold through the project's normal PR process.

## 3. Bootstrap context (the highest-value step)

```
> /ai-sdlc:bootstrap-context
```

Claude drafts `ARCHITECTURE.md`, `CONVENTIONS.md`, and `DOMAIN.md` from the codebase. **Correct the drafts with your tech lead** — over a coffee is the intended ceremony. From that moment the files are human-owned; the model only reads them.

## 4. Daily loop

```
/ai-sdlc:spec        # requirement → reviewed technical plan (human approves BEFORE code)
/ai-sdlc:implement   # execute the approved spec, test-first
/ai-sdlc:review      # adversarial pre-review before human review
/ai-sdlc:triage      # bug report → defect vs working-as-designed, with evidence
```

## Updating

New releases are announced in `#ai-tooling`. Update with:

```
/plugin update ai-sdlc@valorem-ai-sdlc
```

## Client-tenant engagements (no company Claude org)

See [adoption/SETUP.md](adoption/SETUP.md) — the read-only sibling-clone fallback.
