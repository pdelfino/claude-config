Codex will review your output once you are done.

## Org-mode is the default markup

Whenever there's a choice between Org-mode (`.org`) and Markdown (`.md`) — new files, duplicates, format conversions — use Org. Markdown is allowed when an external tool requires it (GitHub auto-renders both, but a static-site generator or package manifest might pin to `.md`); otherwise prefer `.org`. When a project has both a stale `README.org` and a current `README.md`, convert the `.md` content to Org and delete the `.md`.

## Terminal commands for the user to paste

When you give me a command to copy and paste into a terminal (iTerm2), it **must** be a single physical line — all env-vars, flags, and values inlined with spaces.

- No backslash-newline continuations.
- No `<placeholder>` — look up the real value and inline it (e.g. real Heroku app name, real secret, real UUID).
- Applies to `heroku`, `gcloud`, `curl`, `kubectl`, `gh`, `git`, shell pipelines, etc.

For anything that doesn't fit on one short line — heredocs, multi-stage pipelines, multi-line commit message bodies, anything > ~100 chars — use the **slap-temp** convention instead of giving me a multi-line block:

1. Slugify a 3–5 word kebab-case description.
2. Archive the script body to `~/.claude/slap-temp/history/<YYYY-MM-DD-HHMMSS>-<slug>.sh` — never overwritten, permanent record.
3. Append a `write` entry to `~/.claude/slap-temp/history.log` (tab-separated: `iso-timestamp\twrite\tcwd\tslug\tarchive-filename`).
4. Overwrite `~/.claude/slap-temp/pending.sh` with the same body, prefixed by `#!/usr/bin/env bash`, `set -euo pipefail`, and `echo "→ <one-line summary>"`.
5. Tell me to run `slap-temp` (the wrapper at `~/.local/bin/slap-temp` executes whatever is staged and logs the run).

Full protocol with example: `~/.claude/skills/slap-temp/SKILL.md`. **Never put secrets** (API keys, tokens, passwords) in slap-temp — they get archived forever; for those, give me the inline command instead.

## NEVER use markdown blockquotes (`>`)

Blockquotes render in the terminal with a `▎` bar prefixed to every line, and copying the text grabs the bars too, mangling the paste. This applies to ALL output, and doubly to anything Pedro is meant to copy somewhere (form text, email bodies, justificativas, drafts):

- Text meant for copy-paste goes in a fenced code block (```text), which copies clean.
- Quoting someone or a document: use italics or inline quotes, never `>`.

## Auto-copy: the `copy` fence

A Stop hook (`~/.claude/hooks/copy-to-clipboard.sh`) watches every reply: if the final message contains a fenced code block whose info string is `copy` (i.e. triple-backtick immediately followed by the word copy), the hook pipes that block's contents straight to the macOS clipboard, where Maccy captures it. The terminal shows "Copied the marked block to your clipboard (Maccy has it)" when it fires.

So when you produce exactly one piece of data Pedro will paste somewhere else (a single-line terminal command, a UUID/key reference, a one-off SQL statement, a form value, an email or message body, a drafted paragraph), put that one payload in a `copy` fence instead of a plain `text` fence. It still renders and copies clean like `text`, and it lands in his clipboard automatically.

Rules:
- At most ONE `copy` block per message. If several exist, the hook copies the LAST one, so never scatter them. Mark the single most important payload; everything else stays in `text` fences.
- Default to `text`, not `copy`. Use `copy` only when there's a clear, singular "paste this elsewhere" intent. Reserved data that Pedro just reads stays in `text`.
- NEVER put a secret (API key, token, password) in a `copy` block. Maccy keeps clipboard history, so the secret would persist there. This is the same boundary as the never-echo-secrets rule. Secrets still go inline per the slap-temp protocol.
- This does not replace the single-physical-line rule for terminal commands. A one-line command in a `copy` fence is fine (still one physical line); anything multi-line or long still uses slap-temp.

## Session handoff across sessions (every project)

Every project Claude Code runs in should accumulate a rolling handoff in its auto-memory: `project_session_handoff.md` in `~/.claude/projects/<sanitized-cwd>/memory/`. The file captures *semantic* state — what last shipped, what's pending, what to verify — so the next session can pick up without re-interrogating the user.

Two halves, on purpose:

1. **Semantic (Claude, during the session):** Rewrite `project_session_handoff.md` in the project's auto-memory when the user signals wrap-up (says bye, runs `/clear`, pushes a major commit, closes an issue, or the session is obviously ending). Lead with date + what last shipped, then "verify at next session start" checks, then "next tractable work." If the file doesn't exist in the project yet, create it on the first wrap-up.
2. **Deterministic (user-level SessionEnd hook):** Writes `.claude/session-end-state.md` with branch + last 10 commits + `git status --short` at session exit. Gitignored; regenerated each session. Read it early next session to reconcile with the semantic file.

At session start on any project: read both files before the user speaks, and if they conflict with what the user says, trust the user and update memory. If the project has a `PEDRO_AND_CLAUDE.md` (or similar) with project-specific ritual, let that layer take precedence.

The auto-memory system auto-loads `MEMORY.md` for each project, so adding this handoff file to a project's `MEMORY.md` index is the only setup needed — no hooks to install per-project.
