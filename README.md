# conceptual-figure-curious-george

An agent skill for creating conceptual figures for papers and reports: method overviews,
schematics, and explanatory diagrams. By default, it produces three distinct candidates with
editable TikZ source, PDF and PNG renders, and proposed captions.

## Install

```sh
npx skills add NightMachinery/conceptual-figure-curious-george --global \
  --agent claude-code --skill conceptual-figure-curious-george
```

Requires an agent that can run subagents and inspect images. The default TikZ backend needs a
TeX distribution with `latexmk` and the `preview` package, plus Poppler's `pdftoppm`. The bundled
Claude Code comprehension check also needs the `claude` CLI.

## Use

Ask your agent, for example:

> Use conceptual-figure-curious-george to create three method-figure candidates for this paper.
> Explain how the input passes through the model to produce the output. Match the paper's fonts
> and colors, and fit the figure to its full text width.

Provide the paper or source files and any terminology, size, or style constraints.

Designers develop different concepts and write image-generation prompts. You generate a reference
image from each prompt and supply it to the agent. Builders then draw and refine the vector figures,
including checks that a fresh reader can understand them. You choose the final candidate.

Reference images are required by default; ask to skip them for a workflow without that manual step.
Candidate count, feedback rounds, output location, and backend are configurable in the
[skill guide](skills/conceptual-figure-curious-george/SKILL.md).

For repository changes, see [Contributing](docs/contributing.md).
