# Changelog

All notable changes to the AI SDLC Toolkit. Every release bumps `plugins/ai-sdlc/.claude-plugin/plugin.json` `version` and tags `v<version>`.

## [0.1.1] — 2026-08-21

### Fixed
- Duplicate hooks load error on install: removed the `hooks` field from `plugin.json` — `hooks/hooks.json` at the plugin root is auto-discovered by convention, so the manifest reference declared it twice

## [0.1.0] — 2026-08-20

### Added
- Plugin + private marketplace scaffolding (`.claude-plugin/marketplace.json`, `plugins/ai-sdlc/`)
- `/ai-sdlc:init-engagement` — full implementation: scaffolds customer-owned AI SDLC structure (context/, guardrails/POLICY.md, thin CLAUDE.md, TOOLKIT_VERSION) into an engagement repo; idempotent; never writes Valorem URLs into customer git
- v1 spine skill stubs: `/ai-sdlc:bootstrap-context`, `/ai-sdlc:spec`, `/ai-sdlc:implement`, `/ai-sdlc:review`, `/ai-sdlc:triage`
- Subagent stubs: adversarial `reviewer`, `researcher`
- Secret-scan hook on file writes (policy as code)
- Evals harness skeleton (synthetic-only rule), adoption guides (SETUP, SCOPE), CI (markdown lint + link check)
