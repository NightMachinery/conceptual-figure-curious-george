# Contributing

The [skill guide](../skills/conceptual-figure-curious-george/SKILL.md) defines the workflow and
configurable defaults. Supporting instructions live in its sibling `references/` directory;
templates and build helpers live in `assets/` and `scripts/`.

Keep examples generic and free of personal information, machine-specific paths, and research
document details. Document current behavior and link to existing instructions instead of copying
them.

When changing a parameter, keep it user-configurable and state its default in the skill guide.
When changing the TikZ scaffold, copy it into a scratch figure directory and build `example.tex`
as described in the [TikZ backend guide](../skills/conceptual-figure-curious-george/references/backends/tikz.md).
Inspect the render and verify its page dimensions before submitting.

To add a drawing backend, follow the
[backend interface](../skills/conceptual-figure-curious-george/references/backends/README.md)
and add its guide and assets. The shared workflow stays independent of the backend.
