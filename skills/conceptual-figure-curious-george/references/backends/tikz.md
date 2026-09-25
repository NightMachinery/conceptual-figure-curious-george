# Backend: TikZ

For LaTeX documents. Needs a TeX distribution with `latexmk`, `pdftoppm` (poppler) and the
`preview` package.

## Scaffold

At intake, copy into `<figure>/common/`:

- `assets/tikz/preamble.tex` as `common/preamble.tex`, then adapt it: load the document's own class
  or style files, font packages and macro files, in the document's order, so drafts typeset exactly
  as in the document. Keep the `preview` block at the end. If the class adds review-mode line
  numbers, headers or rulers, switch them off in the preamble (for example with the class's
  camera-ready option), or they widen the page.
- `assets/tikz/example.tex` as `common/example.tex`, the template builders copy.
- `scripts/build-latex.sh` as `common/build.sh`, and write the document's LaTeX root (the directory
  holding its class and macro files) into `common/doc-root`, as a path relative to `common/` or
  absolute.
- `assets/tikz/gitignore` as `<figure>/.gitignore`.

Then build `common/example.tex` (copy it to a scratch design directory first) and check that the
PDF page is exactly the text width plus the preview border.

## Draft page

`example.tex` wraps the picture and a `\captionof{figure}{...}` in the `draftfigure` environment:
a minipage of `\textwidth` inside `preview`, so the page is one text-width block and the caption
wraps as it will in print. References to labels that exist only in the document (another figure,
a table) use stand-in text in the draft, with the real `\cref` kept in a comment.

## Build

```
<figure>/common/build.sh <figure>/design-<x>/<slug>-r<N>.tex
```

It compiles in `design-<x>/build/` (private to that design, so designs build in parallel) and writes
`<slug>-r<N>.pdf`, a 200 dpi `<slug>-r<N>.png` and `<slug>-r<N>-nocaption.png` (the figure alone,
for cold reads; the preamble drops `\captionof` when `\draftnocaption` is defined) beside the source.

## Naming and ignore rules

Sources `<slug>-r<N>.tex`. The `.gitignore` ignores `*-r[0-9]*.pdf`, `*-r[0-9]*.png` and `build/`,
so sources, hand-offs and reference images stay tracked.

## Idioms

- `x=1cm, y=1cm`; named styles in the `tikzpicture` options; colors via
  `\definecolor{<prefix>Name}{HTML}{......}` with a per-design prefix so designs never clash with
  each other or with the document.
- Arrow tips from `arrows.meta` (`Stealth`); libraries limited to those the preamble loads.
- Text through the document's macros for its terms, so the figure follows renames.
- Match an existing figure's palette and line weights when the document has one; read its source.

## Integration

The chosen draft's `tikzpicture` and caption move into a `figure` float in the document, the
stand-in references become `\cref`s, and its color definitions go beside it.
