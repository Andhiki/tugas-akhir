# Pilot Smoke-Test Plan

## Status

Prepared on 5 September 2026. This plan does not invoke a model. It defines the smallest run needed before spending account-backed model budget.

## Current runner choice

Use Claude Code as the first runner candidate:

- Claude Code 2.1.92 is installed.
- Print mode can emit JSON.
- A maximum budget can be supplied for a print-mode run.
- Session persistence can be disabled.

Cursor Agent 2026.05.09-0afadcc is the fallback because it also supports non-interactive JSON output. Runner choice is an experimental control, not a capability ranking.

## Smoke-test objective

Verify that one task can be executed in isolated conditions and that the experiment can distinguish:

1. a repository without an instruction file;
2. a Clean instruction file; and
3. a Context-Bloated instruction file.

The Remediated condition is added after the three basic conditions pass the integrity checks.

## Task selection

Choose one small public task from SWE-bench Lite or an equivalent repository issue with:

- a pinned commit;
- a single clear acceptance criterion;
- a test or validation command that works without secrets;
- a reproducible baseline;
- a small expected patch; and
- a license compatible with storing the repository metadata and experiment artefacts.

The task manifest must be frozen before the first model call. Do not use a task whose success depends on an unstable external service.

## Pre-run preparation

For the selected task:

1. clone or copy the repository at the pinned commit;
2. run the baseline validation twice;
3. create the Clean instruction file from verified repository facts;
4. create Context-Bloated by adding low-value content only;
5. compute line count, byte count, and token estimate for both files;
6. record the treatment diff and source note for every Clean statement; and
7. create an isolated workspace for each condition.

The treatment must not add a task hint, false repository fact, new command, or contradictory rule during this smoke test.

## Candidate invocation shape

After the per-run budget and task have been approved, use the equivalent of:

    claude -p "<fixed task prompt>" --model <pinned-model> --output-format json --no-session-persistence --max-budget-usd <budget> --permission-mode acceptEdits

The actual command, model identifier, allowed tools, timeout wrapper, and environment variables must be stored verbatim in the run manifest. The shell wrapper must also record start time, end time, exit status, and timeout status.

## Smoke-test acceptance criteria

The smoke test passes only if all of the following are true:

- baseline validation is reproducible before each run;
- the agent receives the same task prompt in every condition;
- the intended instruction file is present and readable in the workspace;
- the output contains enough information to recover final status and trajectory or stable command logs;
- the final patch can be validated outside the agent loop;
- the run remains within the declared timeout and budget;
- the three condition files differ only in the intended instruction treatment; and
- the result record contains task, condition, model, runner, prompt hash, file metrics, patch, validation, and cost metadata.

## Minimum run matrix

| Run | Condition | Repetitions | Purpose |
|---|---|---:|---|
| 1 | No instruction | 1 | Check task and runner baseline |
| 2 | Clean | 1 | Check loader and Clean treatment |
| 3 | Context-Bloated | 1 | Check that the smell treatment is loaded |

These three runs are a feasibility smoke test, not evidence of an effect. If they pass, repeat each condition at least three times for the pilot and add Remediated.

## Stop conditions

Stop before expanding the sample if:

- the loader does not consistently expose the instruction file;
- the baseline validation changes across repeated runs;
- the runner bypasses or ignores the intended workspace;
- the treatment changes repository facts or task difficulty;
- the log cannot recover final validation and resource metadata; or
- the run cost is higher than the approved budget.

Record a Narrow or Stop decision rather than silently changing the protocol.
