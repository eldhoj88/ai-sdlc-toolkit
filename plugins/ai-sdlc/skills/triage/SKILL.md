---
name: triage
description: Investigate a reported issue and determine defect vs working-as-designed, with evidence citations and a draft ticket response. Use when a bug report, support ticket, or client-reported issue needs investigation.
---

# Triage

> **v1 stub — full workflow to be authored (v1.1).** The outline below is the contract; do not improvise beyond it.

Highest-frequency recurring task in sustained delivery: is this a defect, and where?

Outline:
1. Ingest the report (repro steps, environment, expected vs actual) — list what's missing rather than guessing
2. Investigate: trace the reported behavior to code, check `context/DOMAIN.md` business rules and ADRs for intended behavior
3. Verdict with **evidence citations** (file:line, ADR, acceptance criterion): Defect / Working-as-designed / Cannot-determine (with what's needed)
4. If defect: severity suggestion per the org's S1–S4 definitions, root-cause hypothesis, affected scope
5. Draft the ticket response in client-appropriate language for human review — never send directly
