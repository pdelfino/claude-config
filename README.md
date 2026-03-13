# claude-config

![Pygmalion and Galatea](./painting.jpg)

*"Pygmalion and Galatea" (c. 1890) by Jean-Léon Gérôme — [Wikipedia](https://en.wikipedia.org/wiki/Pygmalion_and_Galatea_(G%C3%A9r%C3%B4me))*

**The leash I keep my AI on. Of course, Emacs biased.**

## About

Configuration files for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (Anthropic's CLI coding assistant), designed around two principles: let the AI do everything locally, but never let it touch anything public without asking first. Emacs keybindings are non-negotiable.

## What's Here

| File | Purpose |
|------|---------|
| `keybindings.json` | Emacs-style keybindings -- `Ctrl+X Ctrl+E` for external editor, `Ctrl+P/N` for history, `Ctrl+X Ctrl+S` to stash |
| `settings.json` | Global permissions for the home directory scope -- all tools allowed, with denials for push/deploy/publish. Hooks for sound notifications. |
| `settings.local.json` | Project-level permissions with broader wildcards, Clojure MCP tool access, and frontend/backend REPL servers |
| `memory/` | Claude's auto-generated memory files, symlinked from `~/.claude/projects/` |

## The Permission Model

| Claude Can | Claude Cannot |
|------------|---------------|
| Read anything | `git push` |
| Write anything | Deploy to prod |
| Run any command | Merge PRs |
| Delete files locally | `npm publish` / `yarn publish` |
| Break things locally | Break things publicly |

The philosophy: make all the mess you want in my house, just don't invite the neighbors to see it.

## Sound Notifications

The config uses macOS `afplay` hooks to provide audio feedback:

- **Gong** -- plays when Claude stops (task complete)
- **Knock** -- plays when Claude asks a question

This pairs well with background workflows -- start a task, switch to another window, and let your ears tell you when Claude needs attention.

## Keybindings

All bindings follow Emacs conventions:

| Key | Action |
|-----|--------|
| `Ctrl+X Ctrl+E` | Open prompt in external editor (Emacs) |
| `Ctrl+X Ctrl+S` | Stash current chat |
| `Ctrl+P` | Previous history entry |
| `Ctrl+N` | Next history entry |
| `Ctrl+X Ctrl+T` | Toggle todos |

## Installation

```bash
git clone git@github.com:pdelfino/claude-config.git ~/projects/claude-config

ln -sf ~/projects/claude-config/keybindings.json ~/.claude/keybindings.json
ln -sf ~/projects/claude-config/settings.json ~/.claude/settings.json
ln -sf ~/projects/claude-config/settings.local.json ~/.claude/settings.local.json

mkdir -p ~/.claude/projects/-Users-pedro
ln -sf ~/projects/claude-config/memory ~/.claude/projects/-Users-pedro/memory
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI installed
- macOS (for `afplay` sound hooks)
- Emacs muscle memory (optional but assumed)

## Related

- [emacs-config](https://github.com/pdelfino/emacs-config) -- The Emacs setup this config rides on top of
- [karabiner-config](https://github.com/pdelfino/karabiner-config) -- Emacs keybindings system-wide on macOS
- [zshrc](https://github.com/pdelfino/zshrc) -- Shell config where `CLAUDE_SLACK_WEBHOOK_URL` lives
- [macos-setup](https://github.com/pdelfino/macos-setup) -- The bootstrap that ties it all together

## License

Personal configuration -- use freely.
