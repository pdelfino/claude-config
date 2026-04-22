Codex will review your output once you are done.

## Terminal commands for the user to paste

When you give me a command to copy and paste into a terminal (iTerm2), it **must** be a single physical line — all env-vars, flags, and values inlined with spaces.

- No backslash-newline continuations.
- No `<placeholder>` — look up the real value and inline it (e.g. real Heroku app name, real secret, real UUID).
- If the command would exceed ~100 characters and risk iTerm2 paste-wrap breaking it, write it to a short shell script (e.g. `/tmp/<task>.sh`) and give me a short `bash /tmp/<task>.sh` to paste instead.
- Applies to `heroku`, `gcloud`, `curl`, `kubectl`, `gh`, `git`, shell pipelines, etc.

## Session handoff across sessions (every project)

Every project Claude Code runs in should accumulate a rolling handoff in its auto-memory: `project_session_handoff.md` in `~/.claude/projects/<sanitized-cwd>/memory/`. The file captures *semantic* state — what last shipped, what's pending, what to verify — so the next session can pick up without re-interrogating the user.

Two halves, on purpose:

1. **Semantic (Claude, during the session):** Rewrite `project_session_handoff.md` in the project's auto-memory when the user signals wrap-up (says bye, runs `/clear`, pushes a major commit, closes an issue, or the session is obviously ending). Lead with date + what last shipped, then "verify at next session start" checks, then "next tractable work." If the file doesn't exist in the project yet, create it on the first wrap-up.
2. **Deterministic (user-level SessionEnd hook):** Writes `.claude/session-end-state.md` with branch + last 10 commits + `git status --short` at session exit. Gitignored; regenerated each session. Read it early next session to reconcile with the semantic file.

At session start on any project: read both files before the user speaks, and if they conflict with what the user says, trust the user and update memory. If the project has a `PEDRO_AND_CLAUDE.md` (or similar) with project-specific ritual, let that layer take precedence.

The auto-memory system auto-loads `MEMORY.md` for each project, so adding this handoff file to a project's `MEMORY.md` index is the only setup needed — no hooks to install per-project.
