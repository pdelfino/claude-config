---
name: Anthropic accounts and API keys
description: Maps the user's two Anthropic accounts to their Console org IDs and to the named env vars in ~/.secure_env_vars
type: user
originSessionId: cf549334-1efa-4097-9e2c-d3d57b35bd41
---
The user has two separate Anthropic accounts, deliberately kept distinct:

- **Personal** — `p.delfino01@gmail.com`
  - Console org ID: `70d950cf-7522-4f31-b875-7f8aa3fecd20`
  - Env var: `ANTHROPIC_API_KEY_PEDRO` in `~/.secure_env_vars`
  - Claude Code authenticates (OAuth) against this account's claude.ai Pro subscription. Heavy usage lives here.
  - Console plan as of 2026-04-22 was "Evaluation access" (free tier) — would need upgrade for real direct-API workloads.
- **Professional / Tallyfor** — `pedro@tallyfor.com`
  - Console org ID: `7a43e7a0-a9bd-49c7-84f3-62df559f8770`
  - Env var: `ANTHROPIC_API_KEY_TALLYFOR` in `~/.secure_env_vars`
  - claude.ai is a Team plan; as of 2026-04-22 it showed 0% weekly usage.

Neither variable is named `ANTHROPIC_API_KEY` (unsuffixed) — that canonical name is intentionally unset so SDKs that default to it fail loudly instead of silently using the wrong account. When making Anthropic API calls on the user's behalf, reach for `$ANTHROPIC_API_KEY_PEDRO` explicitly unless the user specifies otherwise.

To verify a key's org at any time:
```
curl -s -D - https://api.anthropic.com/v1/models -H "x-api-key: $KEY" -H "anthropic-version: 2023-06-01" -o /dev/null | grep -i "anthropic-organization-id"
```
