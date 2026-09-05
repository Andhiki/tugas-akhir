# Pilot Environment Snapshot

> Captured: 23 August 2026  
> Purpose: feasibility check before selecting the agent runner.

## Available tooling

| Tool | Observed version / status | Relevance |
|---|---|---|
| Python | 3.12.5 | Candidate language for the runner and metric processing |
| Docker | 29.0.1 | Candidate isolation mechanism for repository/task runs |
| Git | 2.46.0.windows.1 | Repository checkout and commit pinning |
| GitHub CLI | 2.92.0 | Candidate public-repository/task discovery |
| MiKTeX / latexmk | MiKTeX 25.12 | Proposal-document build |
| Cursor Agent CLI | 2026.05.09-0afadcc | Possible agent runner; logging and account budget still need validation |
| Claude Code CLI | 2.1.92 | Possible agent runner; logging and account budget still need validation |
| Ollama CLI | Not found | Local-model route is not currently available through Ollama |

No model-provider environment-variable names were found in the shell snapshot. Account-backed CLI authentication may still exist, but it must not be assumed for a reproducible experiment until the runner and budget are explicitly verified.

## Implication for the pilot

The runner is intentionally not locked yet. The next technical decision is to select one CLI that can:

1. run non-interactively inside an isolated repository;
2. receive the same task prompt in every condition;
3. produce a machine-readable trajectory or at least stable stdout/stderr logs;
4. expose token, tool-call, timing, and final-status metadata;
5. enforce a per-run budget and timeout;
6. avoid carrying session or filesystem state between paired runs.

Docker is available for isolation. Before any paid or account-backed model call, perform a one-task smoke test with an explicit budget and record the exact CLI invocation in the run manifest.

## Runtime re-check: 5 September 2026

The locally available runner candidates were checked without sending a model request:

| Tool | Current result | Relevant observation |
|---|---|---|
| Cursor Agent | 2026.05.09-0afadcc; login successful, user details unavailable | Supports non-interactive print mode and JSON or stream-JSON output. |
| Claude Code | 2.1.92 | Supports non-interactive print mode, JSON or stream-JSON output, explicit maximum budget, timeout control from the wrapper, and disabling session persistence. |
| Docker | 29.0.1 | Available for repository and dependency isolation. |
| Git | 2.46.0.windows.1 | Available for commit pinning and workspace reset. |
| GitHub CLI | 2.92.0 | Available for public repository and issue metadata. |

### Runner decision for the first smoke test

Claude Code is the current first choice for the smoke test because its print mode exposes a maximum dollar budget and a no-session-persistence option. Cursor Agent remains a valid fallback, especially if its output metadata is easier to parse in the final environment. This is a runner decision, not a claim that Claude is more capable as a model.

No model call has been made yet. The next call requires an explicit per-run budget and a selected public task. The smoke-test record should preserve the exact command, model identifier, output format, exit status, wall-clock time, token metadata if available, and whether the instruction file was read.
