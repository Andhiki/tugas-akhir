# Proposal

Draft proposal utama untuk topik:

**Evaluasi Pengaruh Flaky Test Feedback terhadap Keberhasilan dan Efisiensi AI Coding Agent dalam Automated Program Repair**

## Struktur

- `main.tex` — entry point proposal.
- `chapters/` — Bab 1--4, glosarium, dan daftar pustaka.
- `references.bib` — sumber bibliografi yang dipakai oleh proposal.
- `reading-list.md` — daftar bacaan dengan tautan langsung dan urutan prioritas.

## Kompilasi

Urutan kompilasi yang sudah diuji dari root repository:

```powershell
Set-Location proposal
pdflatex -interaction=nonstopmode -halt-on-error main.tex
bibtex main
pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

Output utama adalah `main.pdf` di folder ini.

Proposal ini masih berupa draft riset: detail benchmark, model, dan jumlah task final dikunci setelah pilot study sesuai kriteria Go/No-Go pada Bab 3.
