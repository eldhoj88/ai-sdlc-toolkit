---
name: review
description: Adversarial review of the current diff before human review — correctness, convention drift, security, test adequacy. Use before opening or requesting review on any PR.
---

# Review

> **v1 stub — full workflow to be authored (v1.1).** The outline below is the contract; do not improvise beyond it.

Pre-filter the diff so human reviewers arrive at a reviewed change, not a raw one. The author's context must NOT review its own work — this skill delegates to the `reviewer` subagent, which has no memory of the authoring rationale and a mandate to find problems.

Outline:
1. Collect the diff (working tree or branch vs main)
2. Launch the `reviewer` subagent with the diff plus `context/CONVENTIONS.md` and `guardrails/POLICY.md`
3. Review dimensions: correctness (edge cases, error paths), convention drift, security (injection, authZ, secrets, data exposure), test adequacy vs the spec's criteria
4. Report findings ranked by severity; the author addresses or explicitly accepts each before requesting human review
5. Never auto-fix silently — findings are shown, fixes are the author's deliberate act
