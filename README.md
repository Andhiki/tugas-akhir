# Thesis Workspace

This repo is split into two LaTeX documents:

- `proposal/main.tex`
- `skripsi/main.tex`

Shared files stay at the root:

- `cls/` for the thesis class
- `assets/` for shared images like the UGM logo

## Build

Build `proposal/main.tex` or `skripsi/main.tex` from your editor, or with `latexmk`.

Example:

```bash
latexmk -pdf proposal/main.tex
latexmk -pdf skripsi/main.tex
```

## Notes

- Keep generated files out of Git.
- Use shared assets only when both documents need the same file.
- Put document-specific figures inside the document folder if they diverge later.
