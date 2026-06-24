---
name: feedback_never_echo_secrets
description: Never pass secret literals as command args or echo them; read from $VAR and pipe via stdin
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 0490335c-a9bf-41b6-bc52-e6cbf2db8140
---

Never put a literal secret value into a Bash command, a Write/Edit payload, or a slap-temp script. Doing so records it permanently in `~/.claude/history.jsonl` (and slap-temp archives), which is exactly how the life-ops#231 leak happened (7 real secret literals ended up in history.jsonl, plus Resend keys in Wrangler debug logs).

**Why:** secrets in tool-call text are logged to disk in plaintext and chmod can't undo it — only key rotation can.

**How to apply:** the secrets are already sourced from `~/.secure_env_vars` (chmod 600) into the shell env. Read from the env var and pipe via stdin so the value never appears in a command argument, chat, or shell history:
- `printf %s "$RESEND_API_KEY"    | gh secret set RESEND_API_KEY --repo pdelfino/le-day-club`
- `printf %s "$STRIPE_SECRET_KEY" | wrangler secret put STRIPE_SECRET_KEY`

Also: never ask Pedro to paste a secret value into the chat (same leak). A PreToolUse guard hook (`~/.claude/hooks/block-secret-literals.sh`, wired in `~/.claude/settings.json`) now blocks Bash/Write/Edit calls containing realistic secret shapes (sk_live_, rk_live_, whsec_, re_, AKIA, sk-ant-, sbp_ with full-length bodies) as a backstop. Referring to a bare prefix in a grep pattern is fine — it only trips on full-length keys.
