# Scope & Boundaries

## What this toolkit is

Engineer-facing execution tooling for the AI SDLC: engagement scaffolding, context bootstrap, spec-first delivery, adversarial review, triage. Used daily, inside engagement repos, under each engagement's recorded AI posture.

## What it is not

- **Not the policy.** The org's delivery standards (`project-standards`) define the AI usage policy, client posture model, QA gates, and security process. This toolkit implements and enforces them; it never overrides them.
- **Not a leads/PM kit.** Estimation, status reporting, and delivery-management workflows are a different audience and cadence — deliberately excluded (candidate for a separate companion).
- **Not stack-agnostic.** v1 is opinionated about the .NET / Azure / Azure DevOps stack. Breadth comes after this stack is proven.
- **Not autonomous.** No unattended multi-step agent runs on client work. Human-approved checkpoints throughout; agent permission prompts stay on.

## Hard boundaries

| Boundary | Rule |
|---|---|
| Customer IP | Never enters this repo — no engagement code, names, data, or derived eval cases |
| Valorem IP | Never enters engagement repos — no toolkit content, no marketplace URLs (scaffold output is customer-owned only) |
| project-standards | Never referenced by content shipped into engagements; never shipped in this repo |
| Prohibited-posture engagements | The toolkit is not used at all — `/ai-sdlc:init-engagement` refuses to scaffold |
