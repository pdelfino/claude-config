#!/usr/bin/env bash
# PreToolUse guard (life-ops#231 prevention).
#
# Blocks any Bash/Write/Edit tool call whose payload embeds a LITERAL secret
# value, so secrets stop leaking into ~/.claude/history.jsonl and slap-temp.
#
# Reads the hook JSON payload on stdin and greps the whole thing for
# high-confidence secret SHAPES. Patterns require a realistic key-length body,
# so merely *referring* to a prefix (e.g. `grep sk_live_ history.jsonl`) does
# NOT trip it -- only a real pasted key does. Exit 2 = block + show stderr to
# Claude. Exit 0 = allow.
#
# The correct pattern (which this hook does NOT block) is to read from the
# already-sourced env var and pipe via stdin, e.g.:
#   printf %s "$RESEND_API_KEY"   | gh secret set RESEND_API_KEY --repo pdelfino/le-day-club
#   printf %s "$STRIPE_SECRET_KEY" | wrangler secret put STRIPE_SECRET_KEY

payload="$(cat)"

# Each alternative requires enough trailing body to be an actual credential.
patterns='sk_live_[0-9A-Za-z]{20,}'        # Stripe live secret
patterns+='|rk_live_[0-9A-Za-z]{20,}'      # Stripe restricted live
patterns+='|whsec_[0-9A-Za-z]{20,}'        # Stripe webhook signing secret
patterns+='|re_[0-9A-Za-z_]{20,}'          # Resend
patterns+='|AKIA[0-9A-Z]{16}'              # AWS access key id
patterns+='|sk-ant-[0-9A-Za-z-]{24,}'      # Anthropic
patterns+='|sbp_[0-9a-f]{40}'              # Supabase personal access token

if printf '%s' "$payload" | grep -qE "$patterns"; then
  {
    echo "BLOCKED: this tool call embeds a literal secret value."
    echo "Pasting/echoing secrets records them in ~/.claude/history.jsonl (see life-ops#231)."
    echo "Read from the already-sourced env var and pipe via stdin instead, e.g.:"
    echo '  printf %s "$RESEND_API_KEY"    | gh secret set RESEND_API_KEY --repo pdelfino/le-day-club'
    echo '  printf %s "$STRIPE_SECRET_KEY" | wrangler secret put STRIPE_SECRET_KEY'
  } >&2
  exit 2
fi
exit 0
