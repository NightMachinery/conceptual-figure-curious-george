# Backends

A backend is how builders draw. The workflow in `SKILL.md` is the same for every backend; a backend
file supplies only the parts below, so adding one (Typst with CeTZ, a slide deck exported to PDF,
SVG) is one new file here plus any assets it needs.

A backend file defines:

- **Scaffold**: what the coordinator puts in `<figure>/common/` at intake (preamble or template,
  build script) and how to adapt it to the host document so drafts use the document's own fonts,
  sizes and macros.
- **Draft page**: how a draft renders at true size, exactly the document's text width, with its
  caption, and nothing else on the page.
- **Build command**: one command per draft, safe to run for several designs in parallel, producing
  a vector file and a PNG beside the source.
- **Source naming**: the source extension for `<slug>-r<N>.<src>`.
- **Ignore rules**: the `<figure>/.gitignore` lines for generated drafts and build output only.
- **Idioms**: conventions builders follow (named styles, colour definitions, units), and how to
  match the document's existing figures in this backend.
- **Integration**: how the chosen source goes into the document later, for the user's reference.

Available: `tikz.md` (default).
