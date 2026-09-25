# The discussion board

A scratch directory outside the repository, one subdirectory per designer:

```
<board>/
  brief.md          the shared designer brief
  a/concepts.md     2 to 3 concepts, each with a different organizing idea
  a/to-b.md         critique addressed to designer b (and so on)
  a/claim.md        the final claim
```

## Converging

1. Each designer writes `concepts.md`, then reads the others'.
2. Critiques go to `to-<other>.md`: overlaps, weak points, what the other design should own.
3. Each writes `claim.md`: one paragraph with the organizing idea and why it differs from every
   other claim. Ideas differ in *what organizes the figure* (the flow of computation, the data each
   step touches, a representation, a worked example, the hypothesis), not in styling.
4. When two designers want the same idea, the one with the stronger concept for it keeps it; the
   other moves. Stop after `discussion_exchanges` exchanges: converge rather than polish.

Designers wait for each other by polling the board with a background loop, never a foreground
sleep. Direct messages between designers are allowed where the host supports them (`hosts.md`); the
board stays the record either way.
