# Research Tools & Software — Inventory & Analysis

> For: Kandidat 1 (Role-Based Multi-Agent LLM for Requirement Ambiguity Detection)
> Date: 14 Juni 2026

---

## 1. Multi-Agent Orchestration Frameworks

### 1.1 CrewAI

**What:** Role-based multi-agent framework where you define agents with specific roles, goals, and backstories that collaborate in crews.

| Aspect | Detail |
|--------|--------|
| Role-based? | ✅ **Native** — agents are defined by `role`, `goal`, `backstory` |
| Multi-LLM? | ✅ Supports any LLM via LiteLLM (OpenAI, Anthropic, Ollama, etc.) |
| Local models? | ✅ Via Ollama integration |
| Orchestration | Sequential, Hierarchical, or Custom process |
| Language | Python |
| License | MIT |
| Stars | ~30K GitHub |
| Version | v0.86+ (stable, active development) |

**+ (Pros)**
- **Role-based by design** — maps directly to our research (stakeholder, developer, tester agents)
- `role`, `goal`, `backstory` → natural fit for prompt-based role specialization
- Built-in task delegation, tool usage, memory, and crew coordination
- Ollama support out of the box → runs local open-source models
- Simple API — minimal boilerplate to define agents
- Active community + good docs

**- (Cons)**
- Higher-level abstraction → less control over low-level message passing between agents
- Overhead for simple MoA patterns (just passing outputs between layers)
- Not designed specifically for research/experimental comparison (no built-in ablation)
- Token usage tracking requires manual integration

---

### 1.2 Microsoft AutoGen v0.4

**What:** Microsoft's redesigned multi-agent conversation framework. Agents converse with each other in rounds.

| Aspect | Detail |
|--------|--------|
| Role-based? | ⚠️ Possible via system prompts, but not a first-class concept |
| Multi-LLM? | ✅ Any LLM via model config |
| Local models? | ✅ Via Ollama or local endpoint |
| Orchestration | Conversation-based (agents take turns speaking) |
| Language | Python |
| License | MIT |
| Stars | ~45K GitHub |
| Version | v0.4+ (complete redesign from v0.2) |

**+ (Pros)**
- Mature, battle-tested by Microsoft Research
- Conversation-based = natural fit for **debate/consensus** patterns
- Fine-grained control over message passing, turn-taking, termination conditions
- Built-in code execution sandbox
- Excellent for research — you can log every inter-agent message
- v0.4 has async, event-driven architecture → scalable

**- (Cons)**
- **No native role concept** — you hack it via system prompts (less ergonomic than CrewAI)
- Steeper learning curve — more configuration required
- Conversation paradigm ≠ layer-based MoA (need to adapt)
- Heavier setup for simple experiments
- v0.4 API changed significantly from v0.2 → migration risk

---

### 1.3 LangGraph (LangChain)

**What:** Graph-based framework for building stateful, multi-actor workflows with LLMs. Nodes = agents, edges = control flow.

| Aspect | Detail |
|--------|--------|
| Role-based? | ⚠️ Possible via node prompts, not first-class |
| Multi-LLM? | ✅ Via LangChain's ChatModel abstraction |
| Local models? | ✅ Ollama + LangChain integration |
| Orchestration | Graph-based (DAG with cycles, conditional edges) |
| Language | Python / JS |
| License | MIT |
| Stars | ~15K GitHub (langgraph repo) |
| Version | v0.4+ (stable) |

**+ (Pros)**
- **Maximum control** — you define the exact graph of agent interactions
- Perfect for custom MoA topologies (layered, debate, council)
- State management built-in (shared state between nodes)
- Conditional edges → dynamic routing based on agent output
- Persistence + checkpointing → reproducible experiments
- LangChain ecosystem → huge integrations (150+ LLM providers, tools, etc.)

**- (Cons)**
- **Most verbose** — every node and edge is explicit code, high boilerplate
- No role abstraction → you build it from scratch
- LangChain dependency chain is heavy (many sub-packages)
- Overkill if you just need 3 agents talking to each other
- Debugging complex graphs can be painful

---

### 1.4 PydanticAI

**What:** Type-safe agent framework by the Pydantic team. Agents have structured input/output schemas.

| Aspect | Detail |
|--------|--------|
| Role-based? | ⚠️ Via agent prompts + structured output, not first-class |
| Multi-LLM? | ✅ OpenAI, Anthropic, Gemini, Ollama |
| Local models? | ✅ Ollama supported |
| Orchestration | Agent delegation or programmatic hand-off |
| Language | Python |
| License | MIT |
| Stars | ~10K GitHub |
| Version | v0.2+ (early but active) |

**+ (Pros)**
- **Type safety** — structured output validated by Pydantic models → perfect for research metrics
- Clean, minimal API — less magic, more control
- Agent delegation pattern → agent A can call agent B as a tool
- Ollama integration built-in
- Dependency injection for testability
- Great for research where you need structured, parseable agent outputs

**- (Cons)**
- **Least mature** of the bunch — still early-stage
- No built-in multi-agent orchestration (you wire it yourself)
- No built-in conversation/debate patterns
- Smaller community → fewer examples, less battle-tested
- Would need to build MoA/council logic from scratch

---

### 1.5 Together MoA (Official Mixture-of-Agents)

**What:** The reference implementation of the MoA paper by Together AI. Simple layered architecture.

| Aspect | Detail |
|--------|--------|
| Role-based? | ❌ No — just "proposer" and "aggregator" layers |
| Multi-LLM? | ✅ Designed for heterogeneous models |
| Local models? | ⚠️ Originally via Together API; can be adapted |
| Orchestration | Layered (proposers → aggregator → next layer) |
| Language | Python |
| License | Apache 2.0 |
| Stars | ~3K GitHub |
| Version | Research code (not a library) |

**+ (Pros)**
- **Ground truth MoA** — this IS the paper implementation
- Extremely simple code (~200 lines in `moa.py`) → easy to understand and modify
- Proven results: 65.1% on AlpacaEval with OSS models
- Perfect baseline for comparison (reproduce original MoA)
- Easy to add role-based prompts on top of existing layer structure

**- (Cons)**
- **Not a framework** — it's research code, not a library with abstractions
- No agent roles, no task management, no memory
- Hardcoded for Together API → needs modification for Ollama/local
- No built-in evaluation/metrics pipeline
- Not designed for ablation studies → you build those yourself
- No conversation/debate mechanism (layer-passing only)

---

### 1.6 Faster-MoA

**What:** Optimized MoA implementation with tree-based structure and early stopping for faster inference.

| Aspect | Detail |
|--------|--------|
| Role-based? | ❌ No — proposer/aggregator tree |
| Multi-LLM? | ✅ Heterogeneous models |
| Local models? | ⚠️ Can be adapted |
| Orchestration | Tree-based MoA with early stopping |
| Language | Python |
| License | MIT |
| Version | Research code |

**+ (Pros)**
- **Faster MoA** — addresses the 16× cost problem (Oriol et al. finding)
- Tree structure → diverse proposals at leaves, aggregation at root
- Early stopping → skip unnecessary layers when consensus is reached
- Relevant to our cost-accuracy trade-off research question
- Paper with benchmarks available

**- (Cons)**
- Same issues as Together MoA — research code, not a framework
- No role-based agent concept
- More complex to modify than simple Together MoA
- Focused on speed optimization, not on quality/role experimentation
- Less community/support than mainstream frameworks

---

## 2. LLM Inference Backends

### 2.1 Ollama

**What:** Run LLMs locally with a simple API. Supports Llama 3, DeepSeek R1, Qwen 2.5, Mistral, etc.

| Aspect | Detail |
|--------|--------|
| Models | 100+ open-source models |
| API | OpenAI-compatible REST API |
| Python SDK | `ollama` package (official) |
| Multi-model | ✅ Run multiple models simultaneously on different ports |
| GPU | ✅ CUDA, ROCm, Metal |
| License | MIT |

**+ (Pros)**
- Free, local, private → no API costs for development
- OpenAI-compatible API → swap with GPT-4/Claude just by changing base URL
- One-command model pull: `ollama pull deepseek-r1:7b`
- Supports reasoning models (DeepSeek R1, QwQ)
- Python SDK is simple: `ollama.chat(model='deepseek-r1', messages=[...])`

**- (Cons)**
- Local GPU required → limited by your hardware (VRAM = max model size)
- Slower than API for parallel requests (single machine)
- Need enough RAM/VRAM to run multiple models simultaneously for multi-agent
- No built-in load balancing between models
- Model quality < closed-source (for now)

---

### 2.2 OpenAI / Anthropic API

**What:** Cloud API for GPT-4o, Claude Sonnet, etc.

**+ (Pros)**
- Best model quality (GPT-4o, Claude Sonnet 4)
- Fast inference, high throughput
- No local hardware needed

**- (Cons)**
- **Expensive** for multi-agent experiments (3+ agents × many turns × dataset)
- No privacy — data leaves your machine
- Rate limits can throttle parallel experiments
- Cost becomes a research variable (budget constraint)

---

## 3. Datasets for Requirement Ambiguity

### 3.1 Orchid Benchmark (HuggingFace)

**What:** First code generation benchmark with ambiguous requirements. 1,304 function-level tasks with 4 ambiguity types (lexical, syntactic, semantic, underspecification).

**+ (Pros)**
- **Specifically designed for ambiguous requirements**
- Labeled with ambiguity types → maps to our taxonomy
- Available on HuggingFace → easy to load
- Covers multiple ambiguity categories

**- (Cons)**
- Focused on code generation, not pure ambiguity detection
- Only 4 ambiguity types (our taxonomy has 6)
- English only
- Small-ish (1,304 tasks)

---

### 3.2 PROMISE Repository

**What:** Classic dataset for requirements classification (functional vs. non-functional). Widely used in RE research.

**+ (Pros)**
- Established benchmark — citations guaranteed
- Available in multiple formats (ARFF, CSV)
- Good for baseline classification tasks

**- (Cons)**
- **Not labeled for ambiguity** — only F vs. NF classification
- Small (~600 requirements)
- Would need manual annotation for ambiguity labels
- English only

---

### 3.3 Mendeley Requirements Ambiguity Dataset

**What:** Dataset on Mendeley Data with labeled ambiguous vs. non-ambiguous requirements.

**+ (Pros)**
- **Directly relevant** — ambiguity-labeled
- Publicly available

**- (Cons)**
- Need to verify quality and labeling methodology
- Possibly small

---

### 3.4 HuggingFace `requirements_ambiguity_v2`

**What:** Fine-tuned BERT model + private dataset with 2,523 labeled Dutch requirements for ambiguity detection.

**+ (Pros)**
- 2,523 labeled requirements → decent size
- Ambiguity-specific labeling
- Model available for comparison baseline

**- (Cons)**
- **Private dataset** — the model is public but the training data isn't fully open
- **Dutch language** — not English or Indonesian
- Not directly usable, but methodology is referenceable

---

### 3.5 Custom Indonesian Dataset (Self-Constructed)

**What:** Build our own by translating English datasets + augmenting with Indonesian software requirements.

**+ (Pros)**
- Fills the Indonesian language gap (our differentiator)
- Can control ambiguity type distribution
- Can augment with real Indonesian project requirements (open-source repos)

**- (Cons)**
- **Time-intensive** to build and validate
- Needs native speaker + RE domain expert for validation
- Translation may introduce or remove ambiguity artifacts
- Inter-annotator agreement needs measurement

---

## 4. Evaluation & Metrics Tools

### 4.1 HuggingFace Evaluate

**What:** Library for computing ML metrics (precision, recall, F1, etc.)

**+ (Pros)**
- Standard metrics out of the box
- Reproducible evaluation

**- (Cons)**
- Generic — need custom metrics for ambiguity taxonomy

---

### 4.2 Cohen's Kappa / Krippendorff's Alpha (manual)

**What:** Inter-annotator agreement measures for human evaluation.

**+ (Pros)**
- Required by pedoman for validating ground truth
- Standard in RE research

**- (Cons)**
- Requires human annotators (costly, slow)
- Need statistical package (`nltk.agreement` or `krippendorff` Python package)

---

## 5. Recommendation

### 🏆 Best Stack for This Research

| Component | Tool | Why |
|-----------|------|-----|
| **Multi-Agent Framework** | **CrewAI** | ✅ Role-based is *native* — maps directly to stakeholder/developer/tester. Ollama support built-in. Simplest API to define role-specialized agents. Easy to add ablation variants (Self-MoA, single-agent). |
| **LLM Backend (Local)** | **Ollama** | ✅ Free, open-source models, OpenAI-compatible API (swap to GPT-4o by changing 1 line). Supports DeepSeek R1, Llama 3, Qwen 2.5. |
| **LLM Backend (Cloud)** | **OpenAI/Anthropic API** | ⚠️ Use sparingly — only for closed-source comparison experiment. Budget-dependent. |
| **MoA Baseline** | **Together MoA** (adapted) | ✅ Use the ~200-line `moa.py` as Self-MoA baseline. Modify to use Ollama instead of Together API. Minimal, transparent, reproducible. |
| **Dataset (English)** | **Orchid + Custom augmentation** | ✅ Only ambiguity-labeled benchmark available. Augment with Mendeley data + manual annotation for missing categories (vagueness, contradiction). |
| **Dataset (Indonesian)** | **Self-constructed** | ✅ Translate English dataset + validate with native speakers. This IS the differentiator of the research. |
| **Metrics** | **scikit-learn + krippendorff** | ✅ Precision/Recall/F1 from sklearn. Inter-annotator agreement from krippendorff package. |
| **Experiment tracking** | **Python + CSV/JSON logging** | ✅ Simple is best for a thesis. Log token counts, costs, per-ambiguity-type metrics. |

### Why CrewAI over others?

| Criterion | CrewAI | AutoGen | LangGraph | PydanticAI |
|-----------|--------|---------|-----------|------------|
| Role-based agents | ✅ Native | ❌ Via prompts | ❌ Via prompts | ❌ Via prompts |
| Setup complexity | Low | Medium | High | Low |
| MoA implementable? | ✅ Easy | ✅ Easy | ✅ Easy | ✅ Manual |
| Ollama support | ✅ Built-in | ✅ Via config | ✅ Via LangChain | ✅ Built-in |
| Research flexibility | Medium | High | High | Low |
| Learning curve | Low | Medium | High | Low |
| **Fit for our case** | **Best** | Good | Overkill | Too early |

The key insight: **CrewAI's role-based design is literally what we're researching**. Using it means our implementation directly embodies the research hypothesis, making the connection between tool and method transparent and easy to explain in the thesis.

---

## 6. UPDATE: Ollama Cloud Pro Model Catalog & Revised Stack (14 Juni 2026)

> **Note:** This section supersedes the tool recommendations in Sections 1--5 above for the LLM backend component. The framework and dataset recommendations remain unchanged.

### 6.1 Ollama Cloud Pro — Available Models (as of June 2026)

Ollama Cloud now offers **20+ cloud models** across 10+ providers, far more than the 4 originally listed:

| Model | Size / Arch | Type | Notes |
|-------|-------------|------|-------|
| **deepseek-v4-pro** | ~1.6T total / 49B active (MoE) | Reasoning, 3 modes, 1M ctx | Newest DeepSeek, frontier |
| **deepseek-v4-flash** | 284B total / 13B active | Reasoning, 1M ctx | Lightweight V4 |
| **deepseek-v3.1** | 671B | General reasoning | Original cloud DS |
| **gpt-oss** | 20B / 120B (MoE, 5.1B active) | Reasoning, agentic | OpenAI open-weight, Apache 2.0 |
| **qwen3.5** | 0.8B–122B (7 sizes) | Multimodal, reasoning | Newest Qwen, multiple sizes |
| **qwen3-coder** | 30B / 480B | Coding, agentic | Qwen coding specialist |
| **qwen3-coder-next** | — | Coding, agentic | Next-gen Qwen coder |
| **gemma4** | e2b / e4b / 12B / 26B / 31B | Multimodal, reasoning, audio | Google's newest |
| **gemini-3-flash-preview** | — | Vision, reasoning | Google Gemini via Ollama |
| **glm-5.1** | — | Agentic, coding | Z.ai's newest flagship |
| **glm-5** | 744B total / 40B active | Reasoning, agentic | Z.ai MoE |
| **glm-4.7** | — | Coding | Z.ai coding model |
| **kimi-k2.7-code** | — | Coding, agentic | Moonshot's newest |
| **kimi-k2.6** | — | Vision, coding, agentic, swarm | Swarm orchestration! |
| **kimi-k2.5** | — | Vision, agentic | Moonshot multimodal |
| **minimax-m3** | — | Coding, agentic, 1M ctx | MiniMax newest |
| **minimax-m2.7** | — | Coding, agentic | MiniMax |
| **minimax-m2.5** | — | Coding, productivity | MiniMax |
| **minimax-m2.1** | — | Multilingual, coding | MiniMax |
| **nemotron-3-ultra** | — | Reasoning, agent workflows | NVIDIA newest |
| **nemotron-3-super** | 120B total / 12B active | MoE, multi-agent | NVIDIA efficient |

### 6.2 Why gpt-oss is the right choice (not closed-source GPT)

**`gpt-oss` is NOT GPT-4o/GPT-4.5.** It's OpenAI's open-weight model:

- **Apache 2.0 license** — free to download, fine-tune, run anywhere
- **Available on:** Ollama, HuggingFace, OpenRouter, Together AI, vLLM, llama.cpp — high reproducibility
- **2 variants:** 120B (MoE, 5.1B active) and 20B (3.6B active)
- **Adjustable reasoning effort:** low/medium/high (like o3/o4-mini)
- **Performance:** gpt-oss-120b ≈ o4-mini on reasoning benchmarks
- **Different architecture from DeepSeek & Qwen** → provides model diversity for Mixed-MoA experiments

This means freelancers or other researchers can reproduce your experiments **without expensive API costs** — they can run gpt-oss locally on a single 80GB GPU or via free Ollama Cloud tier.

### 6.3 Revised Recommended Stack

| Component | Tool | Why |
|-----------|------|-----|
| **Multi-Agent Framework** | **CrewAI** | Role-based is native — `role`, `goal`, `backstory` maps directly to stakeholder/developer/tester. Ollama support built-in. |
| **MoA Baseline** | **Together MoA** (adapted) | ~200-line reference implementation. Modify to use Ollama API. Perfect Self-MoA baseline. |
| **LLM — Stakeholder agent** | **qwen3.5:122b-cloud** | Strong multilingual (EN+ID), general reasoning. Ollama Cloud + OpenRouter. |
| **LLM — Developer agent** | **deepseek-v4-pro:cloud** | Best reasoning model, 3 thinking modes, MoE architecture. |
| **LLM — Tester agent** | **gpt-oss:120b-cloud** | Different arch (OpenAI-style MoE) → diversity for Mixed-MoA. Apache 2.0. |
| **LLM — Self-MoA baseline** | **deepseek-v4-pro:cloud** ×3 | Same model, no role specialization. |
| **LLM — Single-agent baseline** | **deepseek-v4-pro:cloud** | Same model, no orchestration. |
| **LLM — Size ablation** | **qwen3.5:27b-cloud**, **qwen3.5:9b-cloud** | Test whether model size affects per-role ambiguity detection. |
| **LLM — Local dev/testing** | **gemma4:12b** (local) | Quick iteration, zero cloud quota. |
| **LLM Backend** | **Ollama Cloud Pro** | Fixed subscription, no per-token surprises. Same API for local + cloud models. |
| **Dataset (EN)** | **Orchid Benchmark + augmentation** | Only ambiguity-labeled requirement dataset. Augment for missing categories. |
| **Dataset (ID)** | **Self-constructed** | Translate + validate. This IS the differentiator. |
| **Metrics** | **scikit-learn + krippendorff** | Standard P/R/F1 + inter-annotator agreement. |
| **Experiment tracking** | **Python + CSV/JSON logging** | Simple is best for thesis. Log token counts, costs, per-type metrics. |

### 6.4 Key Advantage: Reproducibility Without Expensive API

Every model in the recommended stack is **open-weight and freely available:**

| Model | Local GPU needed | Free alternatives |
|-------|-----------------|-----------------|
| DeepSeek V4 Pro | 80GB+ (or cloud) | Ollama Cloud, Together AI, OpenRouter |
| Qwen 3.5 122B | 80GB+ (or cloud) | Ollama Cloud, HuggingFace, vLLM |
| GPT-OSS 120B | 80GB (single GPU!) | Ollama Cloud, HuggingFace, OpenRouter, Together AI |
| Qwen 3.5 27B | 16GB GPU | Ollama local, HuggingFace |
| Qwen 3.5 9B | 8GB GPU | Ollama local, HuggingFace |
| Gemma 4 12B | 8GB GPU | Ollama local, HuggingFace |

A freelancer with a single RTX 4090 (24GB) can reproduce the **size ablation** experiments locally. The full-scale experiments (122B+ models) can be reproduced via Ollama Cloud free tier or Together AI credits.