# Running the Evals

The evals are the toolkit's regression harness: a small set of golden cases with known-good outputs that tell you whether a change to a skill, agent, or doctrine improved behavior or quietly broke it. **No toolkit PR that changes `plugins/` merges without running them.**

## How to run (v1 — manual)

For each case in `cases/`:

1. Open the case's `input/` in a scratch Claude Code session with the changed plugin loaded:
   ```bash
   claude --plugin-dir ./plugins/ai-sdlc
   ```
2. Run the case's `PROMPT.md` instruction (which skill to invoke, with what input)
3. Score the output against the case's `EXPECTED.md` rubric — each rubric line is pass/fail, no partial credit
4. Record results in the PR description: `evals: N/M passed` with a note on any failure

A failed case means either the change regressed the toolkit (fix the change) or the expected behavior legitimately evolved (update the case **in the same PR**, with rationale).

## Case format

```
cases/<case-name>/
├── PROMPT.md      # what to run: skill, input, any setup
├── input/         # synthetic repo slice or artifact the case operates on
└── EXPECTED.md    # rubric: observable pass/fail criteria, one per line
```

## v1.1 goal

Scripted runner in CI (headless `claude -p` per case + rubric scoring) so evals gate PRs automatically.
