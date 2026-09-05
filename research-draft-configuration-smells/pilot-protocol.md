# Pilot Protocol: Context Bloat

## Objective

Test whether a controlled increase in low-value repository-level instruction context changes an AI coding agent's outcome or resource use on the same task.

## Unit of analysis

One agent run on one pinned repository snapshot, one task, one instruction condition, one model configuration, and one isolated environment.

## Candidate-task requirements

A task is eligible when it has:

- a public repository and pinned commit;
- a small, understandable code change;
- a documented or discoverable build/test command;
- an acceptance criterion that can be checked after the run;
- no required secret or unavailable external service;
- a license and distribution method compatible with the experiment;
- a baseline test result that can be reproduced before the agent runs.

The first pilot should prefer a single language and a small number of repositories. Cross-language generalization is deferred until the runner is stable.

## Treatment construction

For every task, create a condition bundle from the same repository snapshot:

### No instruction

No added repository-level instruction file.

### Clean

A short file containing only repository-grounded facts that are relevant to normal task execution: verified commands, relevant project structure, and non-obvious conventions. Every statement must have a source or verification note.

### Context-Bloated

The Clean file plus controlled low-value content. The added material may be redundant explanations, repeated repository description, and non-actionable background derived from the repository. It must not introduce new commands, false facts, task hints, or contradictory instructions.

### Remediated

The Context-Bloated file with the low-value material removed while preserving the Clean facts. The expected semantic core must be equivalent to the Clean condition.

For each file, record byte count, line count, token estimate, section inventory, source notes, and a machine-readable diff. Do not rely on line count alone as the definition of the treatment.

## Run sequence

1. Reset the repository to the pinned commit.
2. Apply exactly one condition bundle.
3. Run the baseline smoke test and record its output.
4. Start the agent with the fixed task prompt and fixed resource limits.
5. Save the complete trajectory, tool calls, patch, final response, and process metadata.
6. Run the predetermined final validation command outside the agent loop.
7. Reset the repository and repeat with the next condition or repetition.

No condition may reuse uncommitted files, caches, generated artifacts, or agent state from another run unless that cache is explicitly part of the controlled environment.

## Minimum run record

    run_id
    task_id
    repository_url
    repository_commit
    condition
    agent_name
    model_name
    model_parameters
    prompt_hash
    environment_image_or_lockfile
    timeout_seconds
    baseline_test_status
    instruction_file_path
    instruction_file_bytes
    instruction_file_lines
    instruction_file_token_estimate
    instruction_file_read_evidence
    final_test_status
    task_success
    instruction_compliance_score
    input_tokens
    output_tokens
    tool_call_count
    wall_clock_seconds
    files_read
    files_changed
    retry_count
    failure_mode
    notes

## Integrity checks

The pilot is invalid for causal comparison if:

- a condition changes repository code outside the instruction file;
- the agent cannot access or load the file in some conditions without that being intentional;
- the Clean and Remediated files contain different task facts;
- baseline tests fail inconsistently before the agent starts;
- an external service or dependency changes between paired runs;
- metrics are collected differently across conditions.

## Pilot analysis

Report paired differences per task before aggregating. Use success/test outcomes as discrete results and report medians plus spread for tokens, tool calls, and time. Keep trajectory examples for failure-mode analysis. Do not claim statistical generalization from the pilot alone.

## Go/no-go output

The pilot report must end with one of:

- **Go:** treatment integrity, loader validation, reproducibility, and measurement are adequate for expansion;
- **Narrow:** keep the same smell but reduce task/repository scope or revise the treatment;
- **Stop:** the selected agent, benchmark, or treatment cannot support a defensible paired comparison.
