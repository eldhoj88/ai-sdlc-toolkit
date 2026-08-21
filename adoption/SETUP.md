# Setup & Distribution

## Path A — Individual install (works today)

```
/plugin marketplace add https://dev.azure.com/ValoremUS-INT/Valorem%20ASI%20Project%20Delivery/_git/ai-sdlc-toolkit
/plugin install ai-sdlc@valorem-ai-sdlc
```

Requires: Azure DevOps access to this repo (auth rides on your existing git credentials).

## Path B — Org-wide auto-install (requires Claude org admin)

Deploy via the Claude admin console (Managed Settings) so every engineer gets the marketplace and plugin automatically:

```json
{
  "extraKnownMarketplaces": {
    "valorem-ai-sdlc": {
      "source": {
        "source": "url",
        "url": "https://dev.azure.com/ValoremUS-INT/Valorem%20ASI%20Project%20Delivery/_git/ai-sdlc-toolkit"
      },
      "autoUpdate": true
    }
  },
  "enabledPlugins": {
    "ai-sdlc@valorem-ai-sdlc": true
  }
}
```

> **IP rule — do not put this in engagement repos.** `extraKnownMarketplaces` could also be set in a project's `.claude/settings.json`, but that writes a Valorem URL into customer git. Distribution is managed-settings or individual install only; the `/ai-sdlc:init-engagement` scaffold deliberately keeps engagement `settings.json` clean.

## Path C — Client-tenant fallback (no company Claude org available)

For engagements where the client mandates their own model access (Bedrock / Foundry / their Anthropic tenant), the org plugin isn't present. Use a **read-only sibling clone**:

1. Clone this repo **next to** (never inside) the engagement repo
2. In the engagement repo's `.claude/settings.local.json` (git-ignored, personal), grant access to the sibling directory and wire the needed pieces locally
3. Treat the clone as read-only — toolkit improvements go through this repo's PR process from your Valorem identity, never from the engagement context
4. Confirm with the Team Lead that the engagement's AI posture and the client's terms permit the toolkit's use on their tenant

## Releases

- Every release: bump `plugins/ai-sdlc/.claude-plugin/plugin.json` `version`, add a CHANGELOG entry, tag `v<version>`
- Custom marketplaces do not auto-update by default — announce releases in `#ai-tooling`; engineers run `/plugin update ai-sdlc@valorem-ai-sdlc` (org-managed installs with `autoUpdate: true` pick it up automatically)
