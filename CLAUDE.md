Codex will review your output once you are done.

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

## Session handoff across sessions (every project)

Every project Claude Code runs in should accumulate a rolling handoff in its auto-memory: `project_session_handoff.md` in `~/.claude/projects/<sanitized-cwd>/memory/`. The file captures *semantic* state — what last shipped, what's pending, what to verify — so the next session can pick up without re-interrogating the user.

Two halves, on purpose:

1. **Semantic (Claude, during the session):** Rewrite `project_session_handoff.md` in the project's auto-memory when the user signals wrap-up (says bye, runs `/clear`, pushes a major commit, closes an issue, or the session is obviously ending). Lead with date + what last shipped, then "verify at next session start" checks, then "next tractable work." If the file doesn't exist in the project yet, create it on the first wrap-up.
2. **Deterministic (user-level SessionEnd hook):** Writes `.claude/session-end-state.md` with branch + last 10 commits + `git status --short` at session exit. Gitignored; regenerated each session. Read it early next session to reconcile with the semantic file.

At session start on any project: read both files before the user speaks, and if they conflict with what the user says, trust the user and update memory. If the project has a `PEDRO_AND_CLAUDE.md` (or similar) with project-specific ritual, let that layer take precedence.

The auto-memory system auto-loads `MEMORY.md` for each project, so adding this handoff file to a project's `MEMORY.md` index is the only setup needed — no hooks to install per-project.
