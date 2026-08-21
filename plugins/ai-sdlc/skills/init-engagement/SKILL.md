---
name: init-engagement
description: Scaffold the org-standard AI SDLC structure into an engagement repo. Use when starting a new project or engagement, or when an engagement repo is missing the AI SDLC structure (context/, guardrails/, CLAUDE.md, TOOLKIT_VERSION).
---

# Initialize Engagement

You are scaffolding the org-standard AI SDLC structure into the current engagement repository. All template files live in this skill's `templates/` directory — copy from there, never invent structure.

## 1. Preconditions — check before anything else

1. Confirm the current working directory is the **root of a git repository** (`git rev-parse --show-toplevel` matches the cwd). If not, stop and tell the user to run this from the engagement repo root.
2. Confirm this is an **engagement/project repo** — never run against `ai-sdlc-toolkit` itself or `project-standards`. If the git remote or repo content suggests either, stop and ask the user to confirm the target.

## 2. Gather inputs — ask the user, do not guess

Ask for anything not already evident:

1. **Project name** (may be inferable from the git remote — confirm it)
2. **Client name**
3. **AI posture** for this engagement, as agreed with the client during Discovery:
   - `Permitted` (default)
   - `Restricted` — ask for the specific constraints (e.g., "no client data in prompts beyond code", "AI on backend only")
   - `Prohibited` — **stop immediately**. Do not scaffold anything. Tell the user AI tooling must not be used on this engagement and to confirm the posture with their Team Lead.

## 3. Scaffold — idempotent, never overwrite

For each item below: if the target file already exists, **skip it and record the skip** — never overwrite. Fill template placeholders (`{{PROJECT_NAME}}`, `{{CLIENT_NAME}}`, `{{AI_POSTURE}}`, `{{POSTURE_CONSTRAINTS}}`, `{{DATE}}`) as you copy.

| Template (in this skill's `templates/`) | Target in engagement repo |
|---|---|
| `CLAUDE.md.template` | `CLAUDE.md` |
| `context/ARCHITECTURE.md` | `context/ARCHITECTURE.md` |
| `context/CONVENTIONS.md` | `context/CONVENTIONS.md` |
| `context/DOMAIN.md` | `context/DOMAIN.md` |
| `context/DECISIONS/README.md` | `context/DECISIONS/README.md` |
| `guardrails/POLICY.md.template` | `guardrails/POLICY.md` |
| `settings.json.template` | `.claude/settings.json` |

Then write `TOOLKIT_VERSION` at the repo root containing the version from this plugin's manifest (read `.claude-plugin/plugin.json` at the plugin root — the `version` field), e.g. `0.1.0`.

## 4. Hard rules

- **Never overwrite an existing file** — skip and list. If `.claude/settings.json` already exists, show the user a proposed merge of the template's entries instead of replacing the file.
- **Never write Valorem infrastructure references into the engagement repo**: no marketplace URLs, no `extraKnownMarketplaces`, no `dev.azure.com/ValoremUS-INT` links, no toolkit-internal paths. The scaffolded files are customer-owned; they must contain nothing proprietary.
- **Never copy secrets** or environment-specific values into scaffolded files.
- Do not `git commit` — leave the scaffold as working-tree changes for the engineer to review and commit through the project's normal PR process.

## 5. Report

Finish with a short summary:

1. Files **created** and files **skipped** (already existed)
2. The recorded AI posture and where it lives (`guardrails/POLICY.md`)
3. Next step: *"Run `/ai-sdlc:bootstrap-context` to draft the context/ files from the codebase, then correct them with your tech lead — the drafts are yours to own from then on."*
