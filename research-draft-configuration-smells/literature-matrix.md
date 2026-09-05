# Literature Matrix: Repository-Level Instructions and Coding Agents

> Working matrix for the configuration-smells research line. Claims are kept at the level supported by the source abstracts or clearly identified study scope.

| ID | Source | Data / design | What it establishes | What it leaves open for this thesis |
|---|---|---|---|---|
| L1 | Dos Santos et al. (2026), [Configuration Smells in AGENTS.md Files](https://arxiv.org/abs/2606.15828) | Grey-literature review, repository mining, and 100 popular repositories with AGENTS.md or CLAUDE.md | Proposes a six-smell catalogue and automated heuristics; reports that smells are widespread, with Lint Leakage and Context Bloat among the most common categories | It characterizes and detects smells, but does not by itself establish the causal effect of injecting or remediating a smell on an agent run |
| L2 | Chatlatanagulchai et al. (2025/2026), [Agent READMEs](https://arxiv.org/abs/2511.12884) | 2,303 agent context files from 1,925 repositories; content and maintenance analysis | Shows that context files are evolving configuration-like artifacts and identifies which instruction types developers commonly include | It describes structure and content rather than manipulating a file during a matched coding task |
| L3 | Lulla et al. (2026), [On the Impact of AGENTS.md Files](https://arxiv.org/abs/2601.20404) | 10 repositories and 124 pull requests; agent runs with and without an AGENTS.md file | Reports lower median runtime and output-token consumption when an AGENTS.md file is present, with comparable task-completion behavior in that study | The independent variable is file presence, not a named smell; the result does not tell us which content helps or hurts |
| L4 | Gloaguen et al. (2026), [Evaluating AGENTS.md](https://arxiv.org/abs/2602.11988) | SWE-bench tasks plus issues from repositories with developer-committed context files; multiple agents and LLMs | Reports that context files do not generally improve task success and increase inference cost on average; useful instructions can still matter for non-standard practices | Broad context-file conditions do not isolate Context Bloat, so a controlled smell-level treatment remains a distinct question |
| L5 | Jimenez et al. (2024), [SWE-bench](https://arxiv.org/abs/2310.06770) | Real GitHub issue-resolution tasks with repository tests | Provides a widely used task format for evaluating repository-level software-engineering agents | The benchmark alone does not provide a smell treatment or guarantee that every task is suitable for a low-cost pilot |

## Synthesis

The literature now supports a three-layer map:

1. **Artifact landscape:** context files are common and contain recurring instruction patterns (L2).
2. **Smell taxonomy:** named configuration problems can be detected in real files (L1).
3. **Broad intervention evidence:** adding or removing context can change cost and success, but results differ across study settings (L3, L4).

The proposed contribution is the missing bridge: an auditable, within-task experiment that changes one named smell and measures both outcome and resource behavior, including a remediation condition.

## Questions to verify in full-text review

- How exactly does L1 operationalize the boundary for Context Bloat?
- How do L3 and L4 construct, load, and validate context files?
- Which benchmark/task format gives the best reproducibility-to-cost ratio for this thesis?
- Which agent runner exposes reliable token, tool-call, trajectory, and file-loading metadata?
- What statistical treatment is appropriate after the pilot reveals the number of tasks and repeated runs?
