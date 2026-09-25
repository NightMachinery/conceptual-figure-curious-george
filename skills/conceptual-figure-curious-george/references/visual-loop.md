# The visual loop

1. Build with the backend's build command; it writes the draft's vector file and a PNG.
2. View the PNG (an image-reading tool, not a description of the source).
3. Critique against the brief and the reference:
   - legibility at print size (nothing below the document's smallest caption size);
   - text overflowing its box or the page, collisions, cramped labels;
   - alignment to a grid, consistent spacing and line weights;
   - hierarchy: does the eye land first where the brief says it should;
   - colour roles, contrast, and consistency with the document's existing figures;
   - fidelity: every string as specified, nothing extra;
   - notation: every symbol in the figure is defined in the figure or is standard for its readers;
   - self-explanation: each label, subtitle and legend entry makes sense to a reader who has not read
     the document, in plain words; technical terms carry a short gloss; no vague hedges (say
     "illustrative values, not measured", not "schematic");
   - the caption: short, clear, true to the figure.
4. Fix the most important problems, rebuild, view again.
5. Stop when a pass finds nothing worth changing. Then submit, as a new `r<N>`.

Designers use steps 2 and 3 to review a submitted draft, and write the result as numbered feedback.

## Cold-read test

Polish rounds converge to near-identical drafts; comprehension is what feedback must test. Before
each feedback round, the designer runs a fresh reader that sees only the figure-only render
(`<slug>-r<N>-nocaption.png`, from the build), never the brief or the document: it explains what the
figure shows and claims, lists every label, symbol or mark it cannot interpret or that looks
inconsistent, and says what each quantity measures; then, given the caption, what changed. Every
misreading, unclear item or inconsistency is mandatory feedback. Use a new reader each round. A
draft passes when a reader explains it correctly with nothing unclear.

The reader must be isolated for real, not by instruction: a subagent that shares the designer's
working directory can open the document on its own. `hosts.md` gives an isolated launch per host;
on Claude Code, `scripts/cold-read.sh <figure-only.png> [caption-file] [model]`.
