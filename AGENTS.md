# Agent instructions

This repository will be published publicly. Keep private information and cruft out of every file
and every commit:

- No personal or third-party names, emails, paths from anyone's machine, hostnames, project names,
  or details of the documents the skill was used on. Examples stay generic.
- No history notes, superseded text, or audit trails. Describe what the skill does now; delete
  text that stops being true when you touch the text around it.

## Layout

- `skills/conceptual-figure-curious-george/SKILL.md`: parameters, layout, phases and gates.
- `references/`: the modules the phases point to. Each fact lives in one file; others link to it.
- `references/backends/`: one file per drawing backend, against the interface in
  `backends/README.md`. A new backend is a new file there plus its assets; the workflow files do
  not change.
- `assets/<backend>/` and `scripts/`: files the coordinator copies into a figure's `common/`.

## Changing the skill

- Every parameter stays user-configurable, with its default stated in `SKILL.md`.
- Test the TikZ scaffold after changing it: copy it into a scratch figure directory as
  `backends/tikz.md` describes and build `example.tex`.
