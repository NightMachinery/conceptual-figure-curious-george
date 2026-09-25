---
name: conceptual-figure-curious-george
description: Produce several distinct, polished candidate conceptual figures (method overviews, schematics, explanatory diagrams) for a paper or report with a team of subagents. Designers debate until each owns a different organizing idea, write a text-to-image prompt for a visual reference and a build brief, and after the user supplies the reference images each designer's builder draws the figure in a vector backend (TikZ by default) through a render-view-critique loop. Use when the user asks for a new conceptual figure, a method figure, or several design options for one.
---

# Conceptual figures, curious-george workflow

The user says what the figure should explain. A coordinator (you) runs a small team: **designers**
who each own one distinct design, and one **builder** per designer who draws it. The result is a set
of candidate figures, each a vector source plus a rendered draft with its proposed caption. The
workflow stops by presenting the candidates; choosing one and placing it is the user's decision.

## Parameters

Every parameter is user-configurable. Read the user's request for overrides; otherwise use the
default and state it once in the intake summary.

- `designers`: number of designers and candidates. Default 3.
- `feedback_rounds`: designer feedback rounds on the builder's drafts. Default 2.
- `discussion_exchanges`: cap on board exchanges before designers must converge. Default 3.
- `backend`: how figures are drawn. Default `tikz` (see `references/backends/`).
- `reference_images`: `required` (default), the build waits for user-supplied reference images;
  `skip` only when the user explicitly opts out.
- `root`: output root. Default `<repo>/conceptual_figures/curious-george/`.
- `figure_slug`: short kebab-case name for the figure. Default: chosen by you from the request.
- `width` and target height: default the document's full text width; height chosen by designers.
- `models`: default, designers and builders inherit the coordinator's model; the user may choose
  per role.

## Layout

```
<root>/<figure_slug>/
  .gitignore            generated drafts only (backend file); sources and references are tracked
  common/               backend scaffold: preamble or template, build script
  design-a/             one directory per designer (a, b, c, ...)
    handoff-t2i.md      the bare text-to-image prompt, copyable as a whole file
    handoff-<backend>.md  the builder's brief, the builder's source of truth
    <reference images>  supplied by the user; tracked, never modified
    <slug>-r<N>.<src>   one source per submitted round; never overwritten
```

The discussion board lives in scratch space outside the repository (`references/board.md`).

## Phases

Each phase ends at a gate; do not start the next phase before the gate passes.

1. **Intake** (coordinator). Identify the document, its sources of truth for the figure's content,
   its existing figures (the new one must not redraw them, and should share their colour meanings),
   its terminology and style rules. Pick `figure_slug`, create `<root>/<figure_slug>/`, set up the
   backend scaffold (`references/backends/<backend>.md`) and test-build its example. Write the shared
   designer brief from `references/brief-template.md`. Gate: the example builds at true size.
2. **Design** (designers, in parallel). Each brainstorms concepts, then all discuss on the board
   until every designer claims a different *organizing idea* (not a different style).
   Gate: every claim is distinct and each designer explains why.
3. **Hand-off** (designers). Each writes `handoff-t2i.md` (`references/t2i-prompt.md`) and
   `handoff-<backend>.md`, commits its directory, and asks for approval (`references/roles.md`).
   Gate: you approve. Check distinctness, fidelity to the sources (verify every quoted string and
   number against them), the document's rules, and colour consistency with its existing figures.
   Send concrete corrections; approve only when every design is sound.
4. **Reference images** (user). Give the user the list of `handoff-t2i.md` paths and where to save
   each image. Designers wait. Gate: the images exist (skipped only if `reference_images: skip`).
   The user may supply several images per design and name the one to use.
5. **Revise from the reference** (designers). The image may be better than the brief. Each designer
   studies its reference critically and rewrites `handoff-<backend>.md` to adopt what the image does
   better (layout, hierarchy, grouping, styling, presentation), keeping what the document requires
   (terms, exact strings, rules). Gate: the revised brief is committed.
6. **Build** (builders). Each designer spawns one builder with the revised brief and the reference.
   The builder runs the visual loop (`references/visual-loop.md`) until it cannot improve the draft,
   submits it, and iterates on the designer's feedback for up to `feedback_rounds` rounds.
   View every submitted round yourself and relay the user's comments; a reader outside the design
   catches what its designer no longer sees. When the user must choose between options for part of
   a figure, render each option as its own draft (`<slug>-r<N>-<option>`) so they can compare the
   images. Gate: the designer reports `FINAL`.
7. **Present** (coordinator). View every final render yourself. Present the candidates side by side:
   organizing idea, what each adopted from its reference, open nits, the proposed caption, file
   paths. Push the commits. Stop.

## Rules for every role

- The document's content sources win over the brief, the brief over the reference image.
- Captions and in-figure text are proposals; the author owns the wording.
- A figure with invented values says so in plain words ("illustrative values, not measured"); it never
  implies data it does not show.
- Each role writes only inside its own design directory; the coordinator owns `common/` and pushes.
- Commit with explicit pathspecs; concurrent agents share the index (`references/roles.md`).
- Respect the host project's rules on compute, privacy and style; pass them into every brief.

## References

Paths below are relative to the directory of the resolved `SKILL.md`. If this file is a symlink
(installers often link only `SKILL.md`), resolve it first; `references/`, `assets/` and `scripts/`
sit beside the real file.

- `references/roles.md`: coordinator, designer and builder duties, report formats, git.
- `references/board.md`: how designers discuss and converge.
- `references/brief-template.md`: the shared designer brief.
- `references/t2i-prompt.md`: what a reference-image prompt contains.
- `references/visual-loop.md`: render, view, critique, improve.
- `references/hosts.md`: spawning and messaging on specific agent hosts.
- `references/backends/README.md`: the backend interface; `tikz.md` is the default backend.
