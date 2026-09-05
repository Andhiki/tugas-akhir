t# Research Brief: Kandidat Topik Skripsi

> Disusun untuk diskusi dengan dosen pembimbing  
> Tanggal: 11 Juni 2026

---

## Kandidat 1: Role-Based Multi-Agent LLM untuk Deteksi Ambiguitas Requirement

### Judul yang Diusulkan

**"Analisis Efektivitas Role-Based Multi-Agent LLM dalam Deteksi Ambiguitas Requirement Perangkat Lunak"**

Atau varian yang lebih tajam:

- *"Evaluasi Arsitektur Role-Based Multi-Agent LLM untuk Identifikasi Ambiguitas Requirement: Studi Komparatif pada Dokumen Berbahasa Indonesia dan Inggris"*
- *"Deteksi Ambiguitas Requirement Perangkat Lunak Menggunakan Role-Based Multi-Agent LLM: Analisis Berdasarkan Taksonomi Ambiguitas"*

### Problem

Ambiguitas dalam requirement adalah penyebab utama kegagalan proyek software (>70% kasus). LLM single-agent sudah diuji untuk task ini, tapi belum ada yang menguji **role-based multi-agent** di domain ini secara systematic.

### Kontribusi Unik

1. **Role-based agents dengan perspektif berbeda** — stakeholder vs developer vs tester — masing-masing melihat ambiguitas dari sudut yang berbeda
2. **Evaluasi komparatif** — single LLM vs. role-based multi-agent vs. rule-based NLI
3. **Studi bahasa** — ambiguitas di bahasa Indonesia vs. Inggris (low-resource language)
4. **Taksonomi ambiguitas** — lexical, syntactic, semantic, vagueness, incomplete, contradictory

### Paper Kunci yang Sudah Ada

| Paper | Tahun | Relevansi | Gap yang Bisa Lo Isi |
|---|---|---|---|
| **Bashir et al.** "Requirements Ambiguitiy Detection and Explanation with LLMs: An Industrial Study" (ICSME) | 2025 | Single LLM untuk ambiguity detection di industri. 10-shot +20.2% improvement. Human eval 3.84/5. | **Belum ada multi-agent. Belum ada role-based.** |
| **Vijayvargiya et al.** "Interactive Agents to Overcome Ambiguity in SE" (arXiv) | 2025 | Evaluasi LLM agents untuk handle ambiguous instructions di code generation. Claude Sonnet 84% accuracy. | **Focus di code generation, bukan requirement analysis. Belum role-based.** |
| **Oriol et al.** "Multi-Agent Debate Strategies to Enhance RE with LLMs" (arXiv) | 2025 | **PERTAMA** apply MAD ke RE. Binary classification (F vs NF). MAD > baseline +10.9% F1. Cost 16x lipat. | **Belum apply ke ambiguity detection. Belum role-based. Cost analysis masih rough.** |
| **iReDev** (Jin et al., TOSEM 2025) | 2025 | Knowledge-driven multi-agent untuk RE end-to-end. 6 agents (interviewer, end-user, deployer, analyst, archivist, reviewer). | **Fokus ke full RE lifecycle, bukan spesifik ambiguity. Belum evaluasi per-role contribution.** |
| **QUARE** (Cheng et al., arXiv 2026) | 2026 | Quality-specialized agents + dialectical negotiation untuk RE. 98.2% compliance. | **Fokus ke quality attributes, bukan ambiguity detection.** |
| **ReDeFo** (Lu et al., arXiv 2026) | 2026 | Multi-agent (Analyst, Formalizer, Coder) untuk requirements → verified code. | **Fokus ke formalization, bukan ambiguity.** |
| **Amazon SOP** (Giroh et al., 2025) | 2025 | Multi-agent (Clarifier, Planner, Implementor) untuk transform ambiguous SOPs → code. 88.4% accuracy. | **Domain SOP, bukan software requirements. Tapi approach mirip.** |

### Competitive Landscape

**Belum ada paper yang secara spesifik menguji role-based multi-agent LLM untuk deteksi ambiguitas requirement.** Ini gap yang nyata.

Yang paling dekat:
- Oriol et al. (2025) → tapi mereka pakai debate (debater vs debater), bukan role-based
- Bashir et al. (2025) → single LLM, bukan multi-agent
- Amazon SOP → domain berbeda, tapi approach mirip

### Strength

- Gap yang jelas — belum ada yang combine role-based multi-agent + requirement ambiguity detection
- Literature requirement ambiguity udah established — ada taxonomy, dataset, evaluation metrics
- Domain yang accessible — software requirements lebih mudah di-dataset-kan daripada legal text
- Bahasa Indonesia sebagai differentiator yang menarik (low-resource language)
- Evaluation yang bisa rigorous — precision, recall, F1, human agreement

### Risks

- **Self-MoA problem** — Li et al. (2025) menunjukkan Self-MoA (same model repeated) sering outperform Mixed-MoA. Lo harus bisa buktiin kenapa role-based > self-MoA.
- Cost trade-off — Oriol et al. sudah tunjukkan MAD 16x lebih mahal. Lo perlu ablation study.
- Dataset creation — butuh labeled requirement pairs (ambiguous vs clear). Bisa dari public datasets tapi mungkin perlu augment.
- Bahasa Indonesia data scarcity — mungkin susah cari dataset requirement bahasa Indonesia yang sudah labeled.

---

## Kandidat 2: Multi-Agent LLM untuk Deteksi Kontradiksi Normatif dalam Perundang-Undangan Indonesia

### Judul yang Diusulkan

**"Evaluasi Arsitektur LLM Council dalam Pendekteksian Kontradiksi Pasal: Perbandingan Model Open-Source vs. Closed-Source"**

Atau varian:

- *"Deteksi Kontradiksi Normatif dalam Perundang-Undangan Indonesia Menggunakan Arsitektur Multi-Agent LLM Council"*
- *"Analisis Efektivitas Mekanisme Konsensus Multi-Agent LLM terhadap Deteksi Inkonsistensi Regulasi"*

### Problem

Indonesia menghadapi regulatory lag dan fragmentasi hukum. Ribuan peraturan dengan redaksi tumpang tindih. Deteksi manual butuh ahli hukum dan waktu lama.

### Paper Kunci yang Sudah Ada

| Paper | Tahun | Relevansi | Gap yang Bisa Lo Isi |
|---|---|---|---|
| **CLAUSE** (EACL 2026) | 2026 | Benchmark 7500+ contracts dengan 10 anomaly categories. Gemini 2.5 leads 63% F1. Legal contradictions harder than in-text. | **Fokus ke contracts, bukan legislation. Belum multi-agent.** |
| **LegalWiz** (OpenReview 2025) | 2025 | Multi-agent system untuk generate + detect contradictions in legal docs. 3 agents (content gen, contradiction mining, retrieval verification). | **Fokus ke generation + mining, bukan pure detection. Belum role-based. Belum Indonesia.** |
| **ContRAG** (clarinsi, 2026) | 2026 | Contradiction-aware RAG untuk Slovenian law. FAISS + NLI reranking. | **Slovenian law. Single-pipeline, bukan multi-agent.** |
| **ComplianceNLP** (bettyguo, 2026) | 2026 | End-to-end regulatory compliance monitoring. KG-augmented RAG. 12,847 provisions. | **Compliance, bukan contradiction detection. Single pipeline.** |
| **Policy Contradictions NLP** (parkeraddison, 2023) | 2023 | NLI pipeline untuk detect contradictions in DoD policy. Transformer embeddings + NLI classifier. | **Traditional NLP, bukan LLM. US DoD policy, bukan Indonesia.** |
| **Schumann & Marx Gómez** (2023) | 2023 | Prompt-based classifier untuk contradictions in regulatory docs. F1 0.851 vs supervised 0.862. | **Single LLM, bukan multi-agent. No role-based.** |

### Competitive Landscape

Legal contradiction detection udah ada beberapa paper, tapi:
- **Belum ada yang apply multi-agent LLM council** — yang ada cuma single LLM atau traditional NLP
- **Belum ada yang fokus ke Indonesian legislation** — ContRAG fokus ke Slovenian, CLAUSE ke US contracts
- **LegalWiz** paling dekat, tapi mereka fokus ke generation + mining, bukan pure detection + evaluation

### Strength

- Domain yang impactful dan urgent untuk Indonesia
- Pasal.id sebagai data source yang unik
- Gap yang jelas di multi-agent + legal domain
- MoA/council sebagai hipotesis yang menarik untuk diuji

### Risks

- **Ground truth sangat susah** — butuh ahli hukum untuk label "ini kontradiktif atau bukan?"
- **Self-MoA problem** juga apply di sini — lo harus buktiin council > single model
- **Legal domain expertise** — lo butuh domain knowledge yang dalam, susah di-dapat
- **Dataset creation** — butuh labeled pairs of contradictory vs non-contradictory articles
- **Evaluation subjectivity** — beda ahli hukum bisa beda pendapat apakah sesuatu kontradiktif
- **ComplianceNLP** dan CLAUSE sudah establish benchmark — lo harus compete dengan yang sudah ada

---

## Perbandingan Head-to-Head

| Kriteria | Kandidat 1 (Requirement Ambiguity) | Kandidat 2 (Legal Contradiction) |
|---|---|---|
| **Gap yang jelas** | ✅ Belum ada role-based multi-agent untuk ambiguity detection | ⚠️ Ada gap, tapi LegalWiz dan CLAUSE sudah cukup dekat |
| **Literature mapan** | ✅ Requirements engineering = established field | ⚠️ Legal NLP = niche, tapi growing |
| **Dataset available** | ✅ Ada public datasets (PROMISE, SWE-Bench, dll) | ❌ Susah — butuh labeled legal pairs |
| **Evaluation rigor** | ✅ Precision/Recall/F1 + human agreement | ⚠️ Butuh expert annotator, mahal |
| **Bahasa Indonesia angle** | ✅ Natural differentiator | ✅ Juga natural differentiator |
| **Risk Self-MoA** | ⚠️ Harus address | ⚠️ Harus address |
| **Cost to prototype** | ✅ Low — bisa pakai API atau Ollama lokal | ❌ High — butuh data dari Pasal.id + legal expert |
| **Penguji-friendly** | ✅ SE domain lebih familiar buat penguji CS | ⚠️ Legal domain bisa jadi asing buat penguji CS |
| **Dampak praktis** | ✅ Jelas — software quality | ✅ Jelas — legal certainty |
| **Novelty MoA** | ✅ Role-based = angle yang baru | ⚠️ MoA untuk legal udah di-explore (LegalWiz) |

---

## Rekomendasi

**Kandidat 1 (Requirement Ambiguity)** lebih strong untuk skripsi karena:

1. **Gap lebih jelas** — belum ada yang combine role-based multi-agent + requirement ambiguity detection
2. **Dataset lebih accessible** — tidak butuh expert annotator yang mahal
3. **Literature lebih mapan** — requirements engineering established, evaluation metrics jelas
4. **Prototype cost rendah** — bisa build dengan Ollama lokal atau API
5. **Self-MoA challenge** bisa di-address langsung — lo bandingin role-based vs. self-MoA vs. single agent

**TAPI** kalau lo punya akses ke:
- Pasal.id data
- Ahli hukum yang bisa annotate
- Waktu yang cukup

Maka Kandidat 2 juga viable dan impact-nya besar.

---

## Key References

### Multi-Agent LLM Foundations
- Wang et al. (2024/2025). "Mixture-of-Agents Enhances Large Language Model Capabilities." ICLR 2025.  
  🔗 [arXiv](https://arxiv.org/abs/2406.04692) | [PDF](https://arxiv.org/pdf/2406.04692) | [OpenReview](https://openreview.net/forum?id=h0ZfDIrj7T) | [HuggingFace](https://huggingface.co/papers/2406.04692)
- Li et al. (2025). "Rethinking Mixture-of-Agents: Is Mixing Different LLMs Beneficial?" (Self-MoA)  
  🔗 [arXiv](https://arxiv.org/abs/2502.00674) | [PDF](https://arxiv.org/pdf/2502.00674) | [GitHub](https://github.com/wenzhe-li/Self-MoA) | [OpenReview](https://openreview.net/forum?id=rMfhBWRT6C)
- Du et al. (2023). "Improving Factuality and Reasoning in Language Models through Multiagent Debate."  
  🔗 [arXiv](https://arxiv.org/abs/2305.14325) | [PDF](https://arxiv.org/pdf/2305.14325) | [Project Page](https://composable-models.github.io/llm_debate/)

### Requirements Engineering + Multi-Agent
- Jin et al. (2025). "iReDev: A Knowledge-Driven Multi-Agent Framework for Intelligent Requirements Development." TOSEM.  
  🔗 [arXiv](https://arxiv.org/abs/2507.13081)
- Cheng et al. (2026). "QUARE: Multi-Agent Negotiation for Balancing Quality Attributes in Requirements Engineering."  
  🔗 [arXiv](https://arxiv.org/abs/2603.11890)
- Oriol et al. (2025). "Multi-Agent Debate Strategies to Enhance Requirements Engineering with Large Language Models."  
  🔗 [arXiv](https://arxiv.org/abs/2507.05981) | [PDF](https://arxiv.org/pdf/2507.05981) | [IEEE Xplore](https://ieeexplore.ieee.org/document/11190349/)
- Lu et al. (2026). "ReDeFo: Requirements Development and Formalization for Reliable Code Generation: A Multi-Agent Vision."  
  🔗 [arXiv](https://arxiv.org/abs/2508.18675) | [PDF](https://wssun.github.io/papers/2025-ASE-NIER-ReDoFo.pdf)

### Requirement Ambiguity Detection
- Bashir et al. (2025). "Requirements Ambiguity Detection and Explanation with LLMs: An Industrial Study." ICSME 2025.  
  🔗 [IEEE Xplore](https://ieeexplore.ieee.org/abstract/document/11185947/) | [MDU PDF](https://www.ipr.mdu.se/pdf_publications/7221.pdf) | [Conf Page](https://conf.researchr.org/details/icsme-2025/icsme-2025-industry-track/8/Requirements-Ambiguity-Detection-and-Explanation-with-LLMs-An-Industrial-Study)
- Vijayvargiya et al. (2025). "Ambig-SWE: Interactive Agents to Overcome Ambiguity in Software Engineering." ICLR 2026.  
  🔗 [arXiv](https://arxiv.org/abs/2502.13069) | [OpenReview](https://openreview.net/forum?id=X2yzXtH4wp) | [ICLR Poster](https://iclr.cc/virtual/2026/poster/10009007) | [GitHub](https://github.com/sani903/interactivesweagents)

### Legal Contradiction Detection
- CLAUSE (EACL 2026). "Better Call CLAUSE: A Discrepancy Benchmark for Auditing LLMs Legal Reasoning Capabilities."  
  🔗 [ACL Anthology](https://aclanthology.org/2026.findings-eacl.305/) | [Project Page](https://clause-legal.github.io/)
- LegalWiz (2025). "LegalWiz: A Multi-Agent Generation Framework for Contradiction Detection in Legal Documents."  
  🔗 [OpenReview](https://openreview.net/forum?id=Fd8j7abybv)
- ContRAG (2026). "Contradiction-Aware Retrieval for Legal Texts."  
  🔗 [GitHub](https://github.com/clarinsi/LegalContradictionRAG)
- Schumann & Marx Gómez (2023). "Detection of Contradictions and Inconsistencies in Regulatory Documents using Prompt-Engineering."  
  🔗 [Researchr](https://researchr.org/publication/Schumann25-1) | [PDF via ScholarSpace](https://scholarspace.manoa.hawaii.edu/bitstreams/5b99bd69-e789-4864-9cd8-4fe3d912b55a/download)

### SOP / Ambiguity in Other Domains
- Giroh et al. (2025). "Structuring the Unstructured: A Multi-Agent LLM Framework for Transforming Ambiguous SOPs into Code." EMNLP Industry 2025.  
  🔗 [Amazon Science](https://www.amazon.science/publications/structuring-the-unstructured-a-multi-agent-llm-framework-for-transforming-ambiguous-sops-into-code) | [ACL Anthology](https://aclanthology.org/2025.emnlp-industry.163/) | [PDF](https://aclanthology.org/2025.emnlp-industry.163.pdf)