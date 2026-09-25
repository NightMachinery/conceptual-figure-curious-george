# conceptual-figure-curious-george

An agent skill that produces several distinct, polished candidate conceptual figures (method
overviews, schematics, explanatory diagrams) for a paper or report.

The user says what the figure should explain. The coordinating agent sets up a figure directory and
a team of subagents:

1. **Designers** brainstorm and debate on a shared board until each owns a different organizing
   idea, then write two hand-offs: a text-to-image prompt and a build brief.
2. The coordinator approves the designs; the **user** generates a reference image from each prompt.
3. Each designer revises its brief from its reference, and a **builder** draws the figure in a
   vector backend (TikZ by default), iterating through a render-view-critique loop and the
   designer's feedback.
4. The coordinator presents the candidates. Choosing one is the user's decision.

The workflow is backend-independent; backends live in
`skills/conceptual-figure-curious-george/references/backends/`, one file each.

## Install

```sh
npx skills add NightMachinery/conceptual-figure-curious-george --global \
  --agent claude-code --skill conceptual-figure-curious-george
```

The TikZ backend needs a TeX distribution with `latexmk`, the `preview` package, and `pdftoppm`
(poppler).
