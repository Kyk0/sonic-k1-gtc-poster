# SONIC-K1 — NVIDIA GTC 2027 poster

LaTeX/TikZ source for the SONIC-K1 poster. `SONIC-K1_GTC2027_Poster.pdf` is the current build.

```bash
make           # build SONIC-K1_GTC2027_Poster.pdf (needs TeX Live: pdflatex, latexmk, tikz, qrcode, helvet)
make preview   # render preview.png
make watch     # rebuild on save
```

- Edit text and layout in `sections/` (one file per region), numbers only in `numbers.tex`.
- Drop the real-robot photo and logos into `figures/` (names in `figures/README.md`).
- Working with Claude Code or another agent: point it at this folder; it reads `CLAUDE.md` first.
