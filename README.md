# Claude Code Configuration

Personal configuration for [Claude Code](https://claude.ai/code) with Emacs-style keybindings.

## Keybindings

Custom keybindings optimized for Emacs users:

| Binding | Action | Description |
|---------|--------|-------------|
| `Ctrl+X Ctrl+E` | `chat:externalEditor` | Open input in external editor (Emacs) |
| `Ctrl+X Ctrl+S` | `chat:stash` | Stash current input |
| `Ctrl+P` | `history:previous` | Previous command in history |
| `Ctrl+N` | `history:next` | Next command in history |
| `Ctrl+X Ctrl+T` | `app:toggleTodos` | Toggle todo list |

These are additive to Claude Code's defaults. The original bindings (`Ctrl+G` for editor, `Up`/`Down` for history) still work.

## Installation

1. **Clone the repository:**
   ```bash
   git clone git@github.com:pdelfino/claude-config.git ~/projects/claude-config
   ```

2. **Create symlink:**
   ```bash
   ln -sf ~/projects/claude-config/keybindings.json ~/.claude/keybindings.json
   ```

3. **Restart Claude Code** for changes to take effect.

## Customization

Edit `keybindings.json` directly. See the [Claude Code keybindings documentation](https://code.claude.com/docs/en/keybindings) for available actions and contexts.

### Validate with /doctor

Run `/doctor` inside Claude Code to check for keybinding configuration issues.

## Related

- [zshrc](https://github.com/pdelfino/zshrc) - ZSH configuration with Emacs keybindings
