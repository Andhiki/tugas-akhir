# Research Charter: Configuration Smells in AI Coding-Agent Instructions

> Status: provisional research direction and pilot charter  
> Last updated: 23 August 2026

## Working decision

The main research line is the causal impact of a specific configuration smell in a repository-level instruction file. The first pilot will isolate **Context Bloat**. The flaky-test-feedback topic remains a fallback, not an active parallel experiment.

This scope is deliberately narrower than asking whether AGENTS.md is useful in general. Recent studies have already compared the presence and absence of context files, with mixed findings. The contribution proposed here is to manipulate a named smell while keeping the repository, task, agent, model, tools, prompt, and environment fixed.

## Provisional title

**Evaluasi Dampak Context Bloat pada Repository-Level Instruction Files terhadap Kinerja dan Efisiensi AI Coding Agents: Studi Eksperimental Berpasangan**

The title can be shortened after the pilot. The broader configuration-smells framing should only be used if the pilot can be extended to at least one additional smell without changing the experimental protocol.

## Problem statement

Repository-level files such as AGENTS.md and CLAUDE.md provide persistent instructions about project structure, commands, conventions, and validation. They are increasingly common, but their content can contain recurring defects such as excessive context, duplicated tool rules, stale information, blind references, or conflicting instructions.

Existing work establishes three different facts:

1. Context files are widespread and contain structured project guidance.
2. Configuration smells have been catalogued and mined in real repositories.
3. The broad presence of a context file can change agent cost or task outcomes, but the direction and magnitude are not consistent across studies.

What remains open for this project is a controlled answer to a narrower question: **what happens when one diagnosed smell is injected or remediated while everything else stays the same?**

## Research questions

### RQ1 — Outcome

How does Context Bloat in a repository-level instruction file affect AI coding-agent task success, final test pass rate, and verifiable instruction compliance?

### RQ2 — Efficiency and behavior

How does Context Bloat affect input/output tokens, tool calls, wall-clock time, repository exploration, retries, and observable failure modes?

### RQ3 — Remediation

Can a remediation that removes the bloat while preserving task-relevant facts recover outcome and efficiency relative to the bloated condition?

## Initial hypotheses

- **H1:** The Context-Bloated condition changes task success or final validation compared with the Clean condition.
- **H2:** Context Bloat increases resource use or exploratory behavior without a proportional improvement in task outcome.
- **H3:** The Remediated condition reduces the negative resource or outcome effect observed in the Context-Bloated condition.

These are directional working hypotheses, not claims that the result must be negative. A null result is useful if the treatment is demonstrably loaded and the pilot is adequately powered for the selected effect size.

## Scope boundaries

The pilot will use one agent implementation and one model configuration. The main experiment will use pinned repository commits, reproducible tasks, fixed prompts, fixed tools, fixed resource limits, and repeated runs. Results will be interpreted as evidence about the tested agent/model/task/environment combination, not about all coding agents.

The pilot will not compare multiple orchestration frameworks, multiple LLM providers, or all six smell categories. Framework choice is an implementation variable; it is not the research contribution.

## Experimental conditions

| Condition | Instruction state | Purpose |
|---|---|---|
| No instruction | No added repository-level instruction file | Baseline for the contribution of any file |
| Clean | Minimal, repository-grounded, task-relevant instructions | Quality-controlled reference |
| Context-Bloated | The same Clean file plus controlled redundant or low-value context | Isolated treatment |
| Remediated | Context-Bloated file with the low-value content removed | Recovery test |

The treatment must not add new commands, contradictory rules, false repository facts, or task-specific hints. The only intended difference is the amount and usefulness of always-loaded context. Line count, token count, content sections, and a diff between conditions must be recorded.

## Pilot design

The first pilot target is:

- 1--2 public repositories;
- 2--3 tasks per repository;
- 4 conditions per task;
- at least 3 repeated runs per condition when the budget permits.

This gives a target of 24--36 agent runs. The pilot is for feasibility and treatment validation; it is not yet the final statistical sample.

Each task should have a pinned commit, a clear acceptance criterion, a test command that can run in isolation, and a validation result that can be checked after the agent stops. Tasks that require secrets, unavailable services, or non-deterministic external state are excluded from the first pilot.

## Measurements

### Primary outcomes

- task success according to the task acceptance criterion;
- final test pass/fail result;
- verifiable instruction-compliance checklist.

### Secondary outcomes

- input and output tokens, where available;
- number and type of tool calls;
- wall-clock duration;
- files inspected and modified;
- retries, loops, and premature stopping;
- failure-mode category;
- whether the agent actually located and used the instruction file.

## Go/no-go criteria

Proceed to the main experiment only if the pilot demonstrates:

1. the baseline repository and task tests are reproducible;
2. the agent loader can be observed or validated as reading the instruction file;
3. Clean, Context-Bloated, and Remediated files differ only in the intended treatment;
4. the runner can preserve patch, trajectory, test output, timing, and token/tool metadata;
5. the selected task set has enough outcome variation to make comparison meaningful;
6. the run cost and duration fit the available research budget.

If any criterion fails, narrow the study to one repository, one smell, and one task family before expanding it.

## Immediate research deliverables

1. This charter and the literature matrix.
2. A candidate-task manifest with repository URL, commit, task description, commands, license, and known external dependencies.
3. A treatment-construction record for the Clean, Context-Bloated, and Remediated files.
4. A runner smoke test on one task before repeated experiments.
5. A pilot report with a go/no-go decision.

## Decision log

- **23 Aug 2026:** Reframed the gap from “does AGENTS.md help?” to “what is the causal effect of an isolated configuration smell?” because recent studies already evaluate context-file presence and broad context quality.
- **23 Aug 2026:** Selected Context Bloat as the first treatment because it can be manipulated without requiring legal or domain-expert annotation.
- **23 Aug 2026:** Deferred Lint Leakage and Conflicting Instructions until treatment integrity and loader validation work.

## Primary sources consulted

- [Configuration Smells in AGENTS.md Files](https://arxiv.org/abs/2606.15828)
- [Agent READMEs: An Empirical Study of Context Files for Agentic Coding](https://arxiv.org/abs/2511.12884)
- [On the Impact of AGENTS.md Files on the Efficiency of AI Coding Agents](https://arxiv.org/abs/2601.20404)
- [Evaluating AGENTS.md: Are Repository-Level Context Files Helpful for Coding Agents?](https://arxiv.org/abs/2602.11988)
- [SWE-bench: Can Language Models Resolve Real-World GitHub Issues?](https://arxiv.org/abs/2310.06770)
