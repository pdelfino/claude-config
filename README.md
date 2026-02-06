# Claude Config

The leash I keep my AI on.

## What's Here

**keybindings.json** - Because I refused to unlearn 20 years of Emacs muscle memory. `Ctrl+X Ctrl+E` or death.

**settings.local.json** - Claude can do whatever it wants... except yeet code to production or push to GitHub. Trust, but verify. Actually, trust but `deny: ["Bash(git push:*)"]`.

## Philosophy

```
if (action.isLocal && action.isReversible) {
  return "go wild, robot friend";
} else if (action.couldEmbarrassMePublicly) {
  return "let's talk about this first";
}
```

## Installation

```bash
git clone git@github.com:pdelfino/claude-config.git ~/projects/claude-config
ln -sf ~/projects/claude-config/keybindings.json ~/.claude/keybindings.json
ln -sf ~/projects/claude-config/settings.local.json ~/.claude/settings.local.json
```

## The Deal

| Claude Can | Claude Cannot |
|------------|---------------|
| Read anything | `git push` |
| Write anything | Deploy to prod |
| Run any command | Merge PRs |
| Delete my files | Mass destruction via k8s/helm |
| Break things locally | Break things publicly |

Basically: make all the mess you want in my house, just don't invite the neighbors to see it.

## Related

- [zshrc](https://github.com/pdelfino/zshrc) - Where I also force Emacs bindings on everything
