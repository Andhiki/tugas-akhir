# Reading list proposal

Topik proposal: **flaky test feedback pada AI coding agent untuk automated program repair**.

Urutan bacaan di bawah ini dibuat supaya ide risetnya cepat terbentuk. Tidak semua paper perlu dibaca penuh pada tahap awal; mulai dari abstrak, pendahuluan, metode, dan bagian threats/limitations.

## Prioritas 1 — fondasi masalah dan eksperimen

1. **Qin et al. (2021), “On the Impact of Flaky Tests in Automated Program Repair.”**
   Paper paling dekat dengan pertanyaan riset kita. Baca untuk memahami bagaimana flaky test dapat mengganggu fault localization dan repairability pada APR.
   [Author repository](https://orbilu.uni.lu/handle/10993/50217) · [DOI](https://doi.org/10.1109/SANER50967.2021.00035)

2. **Parry et al. (2022), “A Survey of Flaky Tests.”**
   Peta konsep utama tentang definisi, penyebab, deteksi, dan dampak flaky test.
   [Accepted manuscript](https://eprints.whiterose.ac.uk/id/eprint/230095/1/parry2021.pdf) · [DOI](https://doi.org/10.1145/3476105)

3. **Tahir et al. (2023), “Test Flakiness’ Causes, Detection, Impact and Responses: A Multivocal Review.”**
   Review yang lebih baru untuk membandingkan terminologi dan strategi penanganan flakiness.
   [Open-access article](https://doi.org/10.1016/j.jss.2023.111837)

4. **Just et al. (2014), “Defects4J: A Database of Existing Faults to Enable Controlled Testing Studies for Java Programs.”**
   Dasar pemilihan benchmark dan alasan Defects4J cocok untuk eksperimen APR yang terkontrol.
   [Full text](https://people.cs.umass.edu/~rjust/publ/defects4j_issta_2014.pdf) · [DOI](https://doi.org/10.1145/2610384.2628055)

## Prioritas 2 — AI coding agent dan feedback loop

5. **Bouzenia et al. (2025), “RepairAgent: An Autonomous, LLM-Based Agent for Program Repair.”**
   Contoh agent APR modern dan cara agent memakai test execution dalam loop perbaikan.
   [Full text](https://www.software-lab.org/publications/icse2025_RepairAgent.pdf) · [DOI](https://doi.org/10.1109/ICSE55347.2025.00157)

6. **Maddila et al. (2026), “Agentic Program Repair From Test Failures at Scale: A Neuro-Symbolic Approach With Static Analysis and Test Execution Feedback.”**
   Relevan untuk melihat bagaimana test feedback dipakai agent pada skala besar serta bagaimana static analysis dan eksekusi test digabungkan.
   [Preprint](https://arxiv.org/abs/2507.18755) · [DOI](https://doi.org/10.1109/TSE.2026.3696849)

7. **Bouzenia & Pradel (2025), “Understanding Software Engineering Agents: A Study of Thought-Action-Result Trajectories.”**
   Berguna untuk merancang logging trajectory: keputusan agent, tool call, hasil test, dan perubahan perilaku setelah feedback.
   [Full text](https://www.software-lab.org/publications/ase2025_trajectories.pdf) · [DOI](https://doi.org/10.1109/ASE63991.2025.00234)

8. **Henderson et al. (2023), “Flake Aware Culprit Finding.”**
   Memberi konteks tentang respons flake-aware; paper ini bukan evaluasi AI coding agent, tetapi membantu membedakan deteksi/pemulihan flakiness dari eksperimen pengaruh feedback.
   [Google Research page](https://research.google/pubs/flake-aware-culprit-finding/) · [DOI](https://doi.org/10.1109/ICST57152.2023.00041)

## Bacaan tambahan

9. **Parry et al. (2020), “Flake It ’Till You Make It: Using Flaky Test Detection to Prevent Test Flakiness.”**
   Contoh pendekatan deteksi flakiness berbasis repeated execution.
   [Author PDF](https://o-parry.github.io/papers/2020a.pdf) · [DOI](https://doi.org/10.1145/3387940.3392177)

10. **Jimenez et al. (2024), “SWE-bench: Can Language Models Resolve Real-World GitHub Issues?”**
    Bacaan benchmark agent software engineering; gunakan untuk memahami trade-off antara benchmark realistis dan eksperimen yang terkontrol.
    [Paper](https://arxiv.org/abs/2310.06770)

11. **Krafczyk & Schmid (2026), “Reproducible Automated Program Repair Is Hard — Experiences With the Defects4J Dataset.”**
    Penting untuk bagian reproducibility dan ancaman validitas eksperimen APR berbasis benchmark.
    [Preprint](https://arxiv.org/abs/2604.26674)

## Cara membaca untuk proposal

Setelah membaca empat paper Prioritas 1, tulis tiga hal untuk masing-masing paper: (1) unit eksperimennya, (2) metrik yang digunakan, dan (3) keterbatasan yang masih menyisakan ruang untuk eksperimen kita. Bab 2 dan Bab 3 proposal sudah disusun agar catatan tersebut dapat langsung dipetakan ke related work dan desain eksperimen.
