# Roles

## Coordinator

- Runs intake, writes the shared brief, spawns the designers, relays what the host cannot deliver
  directly (SKILL.md, Harness).
- Approves hand-offs (SKILL.md phase 3). Approval is a message naming the design; corrections are
  concrete ("orange means held-out in the existing figure; use it for H, not for relation C").
- After approval, tells each designer to stop until the reference images exist, then sends the
  go-ahead with the chosen image's path.
- Views every submitted final render before presenting it. Pushes all commits at the end.

## Designer

- Owns one design directory and one organizing idea.
- Reads the content sources before designing; quotes strings exactly from them.
- Discusses on the board (`board.md`), claims an idea, writes both hand-offs.
- Stops at each gate and waits for the coordinator's message.
- After the reference arrives, revises `handoff-<backend>.md` from it (SKILL.md phase 5).
- Spawns exactly one builder. If a builder is already running when the brief changes, sends it the
  revised brief instead of spawning another.
- Reviews each submitted draft by viewing its render and running the cold-read test
  (`visual-loop.md`); feedback is a numbered list of concrete changes, comprehension problems
  first, polish last. At most `feedback_rounds` rounds.

## Builder

- Source of truth: `handoff-<backend>.md`. Visual target: the reference image, viewed before
  drawing anything.
- Works only in its design directory; scratch files go in the backend's build directory, never
  beside the sources.
- Measures real sizes in the document's class: size commands differ between classes, so a brief's
  sizes are points, and the builder checks what the class actually sets.
- A round started from a superseded brief is discarded, not submitted.
- Runs the visual loop; every submitted round is a new `<slug>-r<N>` source; never overwrites one.
- Submits paths of the source and render, plus what it could not resolve.

## Reports

The first line names the report, so the parent can act without reading further:

- `APPROVAL-REQUEST design-<x>`: organizing idea in two sentences, why it differs from the others,
  both hand-off paths.
- `DRAFT design-<x> r<N>`: builder to designer; source and render paths, open issues.
- `FINAL design-<x>`: final source and render paths, the proposed caption, what was adopted from the
  reference and what was kept from the brief (and why), remaining nits.
- `BLOCKED design-<x>`: what is missing and the default that will be used if nobody answers.

## Git

- `git add` your directory, then `git commit -F - -- <your directory>`; never a bare commit, since
  other agents stage in the same index. Check `git status` right before committing; if
  `index.lock` exists, wait and retry.
- Designers commit at hand-off and after each round; they do not push. Never rebase, amend or
  force-push.
- Commit sources, hand-offs and reference images; generated drafts are ignored by the backend's
  `.gitignore`.
