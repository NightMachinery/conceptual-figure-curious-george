# The reference-image prompt (`handoff-t2i.md`)

The file is the bare prompt: the user copies the whole file into an image model. No heading, no
"paste below the line", no notes to the user.

It must stand alone. The image model knows nothing about the document, so the prompt explains the
idea in plain language and gives:

- the purpose: what a reader should understand at a glance, in two to four points;
- the composition: regions, their order, grouping, what connects to what;
- every text string to render, spelled exactly, and nothing else; plain words over notation the
  image does not define (a symbol such as a subject variable needs its meaning in the figure);
- what must not appear (numbers the figure does not claim, other figures' content, titles);
- modern styling, stated explicitly:
  - restrained typography, one serif or sans family, few sizes;
  - generous whitespace; alignment and spacing do the organizing;
  - a small coherent palette, given as hex values with their meanings;
  - soft rounded panels, hairline rules, uniform line weights;
  - no drop shadows, gradients, 3D, clip art or icons;
  - no title or caption inside the image;
- a closing checklist the model verifies before finishing (structure, strings, colour roles).

Open with an instruction to generate the image directly rather than build a vector graphic.
