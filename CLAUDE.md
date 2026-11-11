# SONIC-K1 GTC 2027 poster — guide for coding agents

A one-page LaTeX/TikZ research poster for **NVIDIA GTC 2027** (San Jose, March 15–18).
Goal: get accepted. Reviewers are NVIDIA staff. Keep it clean, honest, readable from 2 m.

## Build and look (do this after every change)

```bash
make            # pdflatex via latexmk -> poster.pdf
make preview    # -> preview.png ; open it and LOOK at it
make check      # errors, overfull boxes, stray numbers
```

Never report a change as done without rendering `preview.png` and inspecting it for overlaps,
text running out of its panel, uneven spacing or clipped elements.

## How the layout works

- `main.tex` draws everything on one TikZ canvas. Units are **bp**, origin **top-left**, **y grows downward**.
- Page: `\PW` × `\PH` = 3096 × 1728 bp (43 × 24 in). Margins `\ML` = 64. Content width `\CW` = 2968.
- Vertical bands (bp): header 0–318 · headline tiles 356–492 · panels from `\RowA`=540 to ~1560 · footer 1584–1728.
- Three full-height panels: 01 idea + contributions + G1 comparison (col A) · 02 SONIC network schema, how we did it,
  built-with-NVIDIA logo tiles (col B) · 03 sim/robot pictures, benchmarks, robustness, real-robot stability (col C).
  `\ShowRealKOne` in panel 03 drops the real-robot photo.
- Style: plain Helvetica only (Courier only for code), no arrows; show change as "X from Y".
- Panel columns: `\ColA`=64, `\ColB`=1077.33, `\ColC`=2090.67, each `\ColW`=941.33 wide, 72 gaps.
- Each region is one file in `sections/`. Positions are absolute: when you move or resize something,
  update its neighbours so gutters stay equal.
- Helpers in `style.tex`:
  `\T{x}{y}{size}{colour}{text}` one line, (x,y) = left end of baseline ·
  `\TR` right-aligned · `\TC` centred · `\Par{x}{y}{width}{size}{leading}{colour}{text}` wrapped paragraph ·
  `\Lab` mono label · `\PanelHead{x}{y}{num}{title}` · `\Bar{x}{y}{length}{value}{max}{height}{colour}` ·
  `\Legend` · `\Picture` and `\Logo` (auto placeholders until the file exists in `figures/`).
- TikZ arithmetic overflows above ~16,000: write `#value/100*length`, not `length*#value/100`.

## Type and colour

- Helvetica (`helvet`) for text, Courier bold for small mono labels. Sizes in bp:
  title 70 · tiles 58 · panel headings 32 · body 21–25 · captions 20 · never below 19.
- Colour meaning is fixed everywhere: **grey `before` = G1 / v0.1 / before**, **green `nvgreen` = ours / after**,
  `gtext` = green used as text, `alert` = only for the 40 ms failure. Do not add colours.
- No shadows, gradients, rounded corners, emoji, or extra decoration.

## Numbers and claims (non-negotiable)

- Every number comes from **`numbers.tex`**, which cites the paper table for each value. Never type a
  number into `sections/`. `CLAIMS.md` maps every claim to its source; update it when you change one.
- Source of truth: SONIC-K1 arXiv:2610.39327 v3. G1 values are SONIC's *reported* numbers and must always
  say "reported" / "as reported", with the note that robot, data and test clips differ.
- Allowed: "first open-weights general motion tracker for the Booster K1, to our knowledge";
  "under 2% of SONIC's reported compute"; "walks and turns without the earlier leg shaking in our runs";
  "teleoperation encoder trained".
- Forbidden: any other "first", "smallest", "state of the art", "matches SONIC"; VR teleop, video/SMPL input
  or VLA presented as working; comparing MPJPE millimetres between robots; BeyondMimic / Any2Track numbers;
  hiding the success rule, the single seed, or that hardware data is three clips on a safety belt.

## Official GTC 2027 poster rules (from the submission guidelines, non-negotiable)

- Page 43 x 24 in. **1 in white margin**: design area 41 x 22 in; no image or type outside it.
  `main.tex` scales the whole layout (drawn on the 3096 x 1728 grid) by 0.91667 into the design area.
- **No NVIDIA branding or logos** (no NVIDIA eye, no NVIDIA logo files). Naming NVIDIA tools in text is fine.
- Submit a print-ready, full-size PDF at 300 dpi: every raster image must be >= 300 dpi at its printed size.
- Structure: problem/goal, application of NVIDIA technology, benchmarking method (data, hardware, tools),
  results with charts/tables; explain acronyms; cite prior work, datasets and tools.
- No marketing language or product promotion (no "revolutionary", "industry-leading", slogans);
  only content cleared for public presentation. Contact: GTC_Content@nvidia.com.

## What each panel answers (GTC poster criteria)

| Criterion | Where |
|---|---|
| Problem statement / goal | title, subtitle, panel 01 |
| Application of NVIDIA technology | "built with" line, panel 02 |
| Benchmarking methodology | panels 03, 04 (labels state set, simulator, rule) |
| Results and outcomes | tiles, panels 01, 05, 06 |
| Practical impact | panel 06, footer (open code, weights, robot app, laptop demo) |
| Accelerated computing | tile 1, panel 01 compute row, panel 02 (16,384 envs on one GPU) |

## Still open

- `figures/real_k1.jpg`, `figures/logo_atr.png`, `figures/logo_kent.png` (see `figures/README.md`).
- Official GTC 2027 poster size/template: check the submission portal. Earlier GTC specs were 44 × 35 in
  with a 1 in margin and an NVIDIA-added band at the top; if that applies, change `\PW`/`\PH` and re-lay out.
- If a same-pipeline G1 evaluation or a height-scaled (0.18 m) K1 evaluation is run, update `numbers.tex`,
  panel 01 and `CLAIMS.md` together.
