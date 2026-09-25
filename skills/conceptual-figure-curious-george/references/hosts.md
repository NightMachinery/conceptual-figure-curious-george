# Host notes

The workflow needs three capabilities: spawn a subagent, send it a message later, and let a
designer spawn its own builder. Where a host lacks one, the coordinator fills the gap.

## Claude Code

- Spawn designers with the `Agent` tool, in one message so they run in parallel. Each gets a short
  prompt: its letter, its directory, the board path, the path of the shared brief, and "stop at the
  approval request".
- After spawning, send every designer its siblings' agent IDs with `SendMessage`; siblings can then
  message each other. The board remains the record.
- A designer that has finished its turn is resumed by `SendMessage`; use this for approvals, the
  reference go-ahead and corrections.
- Designers spawn their builders with `Agent`. If that fails, the designer reports `BLOCKED` and the
  coordinator spawns the builder and relays drafts and feedback.

## Other hosts

Without messaging, run the phases as rounds: the coordinator starts each designer for one phase,
waits for its report, and starts the next phase with a new prompt that includes the board state.
Without nested spawning, the coordinator spawns builders and relays between builder and designer.
