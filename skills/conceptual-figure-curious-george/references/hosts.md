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
- Cold reads (`visual-loop.md`) run in a separate process, not an in-process subagent:
  `scripts/cold-read.sh` starts `claude -p --restricted --tools Read --strict-mcp-config` in a
  temporary directory holding only the render (and the caption, for the second question).
  `--restricted` confines the file tools to that directory, so the reader cannot open the document,
  and no project instructions or memory load there. `--permission-mode default` is passed because a
  profile whose default mode is `plan` would refuse otherwise.

## Other hosts

Without messaging, run the phases as rounds: the coordinator starts each designer for one phase,
waits for its report, and starts the next phase with a new prompt that includes the board state.
Without nested spawning, the coordinator spawns builders and relays between builder and designer.
