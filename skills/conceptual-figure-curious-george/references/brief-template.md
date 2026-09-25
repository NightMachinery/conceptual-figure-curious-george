# Shared designer brief (template)

The coordinator fills this in at intake and saves it as `<board>/brief.md`. Replace every `<...>`;
delete sections that do not apply. It points to the skill's references instead of restating them.

---

# <figure_slug>: <one line on what the figure must explain>

You are one of <designers> designers (<letters>). Together you produce <designers> distinct,
excellent candidate designs for one new conceptual figure in <document>. The author will choose.
<deadline or time budget, if any>

## What the figure is for

<Two to five sentences: the document's question, what the figure must make a skimming reader
understand, and where it will likely sit.>

Sources of truth (read before designing): <paths>.
Terms to use: <the document's names for the key concepts>.
Existing figures not to redraw: <paths and what they show>. Their color meanings: <roles>.

## Rules that bind you

<The document's style and content rules: forbidden words, punctuation, how numbers may appear,
anonymity, anything the author enforces.>

## Workflow

Follow `<skill>/references/roles.md` (designer), `board.md` and `visual-loop.md`.

- Board: `<board>`. Your directory: `<root>/<figure_slug>/design-<you>/`.
- Hand-offs: `handoff-t2i.md` (`<skill>/references/t2i-prompt.md`) and `handoff-<backend>.md`,
  which fixes every string, the layout, hierarchy, palette (hex), typography, size (width
  <width>, a target height), what must not appear, and the proposed caption.
- Backend and build: `<skill>/references/backends/<backend>.md`; scaffold in
  `<root>/<figure_slug>/common/`.
- Limits: <discussion_exchanges> board exchanges, <feedback_rounds> feedback rounds.
- Stop and wait at: the approval request, and again after approval until the coordinator sends the
  reference image path<, unless reference images are skipped>.

## Project constraints

<Compute limits, privacy rules, git conventions beyond roles.md, anything else from the host
project.>
