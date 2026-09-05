# Proposal Configuration Smells

Draft proposal kedua untuk topik configuration smells pada repository-level instruction files yang dibaca AI coding agents.

## Fokus

Proposal ini memakai enam smell sebagai taxonomy, tetapi membatasi eksperimen utama pada Context Bloat, Lint Leakage, dan Conflicting Instructions.

Context Bloat menjadi primary smell untuk pilot dan mempunyai kondisi Remediated. Jika treatment dua smell lain tidak cukup terkontrol, scope dapat dipersempit secara resmi tanpa mengubah research question utama.

## Build

Folder proposal ini memakai template yang sama dengan folder proposal.

### Auto-compile dan live PDF preview

Jalankan perintah berikut dari root repository menggunakan PowerShell:

```powershell
Start-Process "C:\Users\LENOVO\AppData\Local\SumatraPDF\SumatraPDF.exe" `
  -ArgumentList "-reuse-instance","C:\.Projects\tugas-akhir\proposal-configuration-smells\main.pdf"

.\.zed\latexmk-wrapper.ps1 `
  -pvc `
  -f `
  -view=none `
  -synctex=1 `
  -pdf `
  -interaction=nonstopmode `
  -file-line-error `
  -recorder `
  .\proposal-configuration-smells\main.tex
```

Biarkan terminal tetap berjalan selama mengedit dokumen. `latexmk` akan
melakukan compile ulang setiap kali file sumber berubah dan SumatraPDF akan
memuat ulang PDF secara otomatis. Tekan `Ctrl+C` untuk menghentikan watcher.

## Catatan

Folder ini dibuat sebagai sibling baru. Folder proposal dan research-draft-configuration-smells tidak diganti atau dihapus.
