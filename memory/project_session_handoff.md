---
name: Rolling session handoff (cwd=/Users/pedro)
description: Semantic snapshot of what shipped this session, what's pending, what to verify next
type: project
originSessionId: 2026-06-23-transcripts-and-clipboard-hook
---
# Session handoff, 2026-06-23 (YouTube transcripts + clipboard hook)

## What shipped this session
- **YouTube transcripts pipeline.** Pulled English auto-captions (yt-dlp, no video download) for 8 System Crafters Live videos from the open Brave tabs, cleaned + reflowed into 80-col Org paragraphs. Saved to `pdelfino/notes` under `transcripts/system-crafters/` (8 `.org` + `index.org`), committed on branch `transcripts/system-crafters` and **pushed to origin** (PR/merge to main still optional). Raw single-line `en-orig` sources stay in `~/yt-transcripts/`; the `.en.txt` duplicates were deleted. Staged via slap-temp (archive `2026-06-23-160324-youtube-tabs-to-transcripts.sh`).
- **`.secure_env_vars` cleanup (this machine).** Added missing `export` to INTERNAL_TRIGGER_SECRET / ADMIN_GONG_SECRET / EMAIL_WORKER_URL, deleted stale commented-out secrets, deduped EMAIL_WORKER_URL -> `$NEXT_PUBLIC_EMAIL_WORKER_URL`. Backup: `~/.secure_env_vars.bak-20260623-151032`. Not under git (correct for a secrets file).
- **Auto-copy clipboard feature.** New Stop hook `~/.claude/hooks/copy-to-clipboard.sh` copies a ```copy fenced block from the final reply to the macOS clipboard (Maccy). Wired into `claude-config/settings.json` Stop array (alongside the gong); convention documented in `claude-config/CLAUDE.md`.
- **Contacts.** Added 13 Football & Pilates (`soccer-1`) attendees to macOS Contacts (last-name " LDC" suffix + company=LDC), deduped against existing by phone (15 already present, skipped).
- **life-ops#245** filed (hair-on-fire, tech-setup, type:errand): sync `.secure_env_vars` on the OLD MacBook with this machine's cleanup; includes a reminder to rotate the deleted tokens at their providers if still live.

## Verify / pending next session
1. **`claude-config` has UNCOMMITTED changes**: `settings.json` + `CLAUDE.md` (the clipboard-hook work). The hook script `~/.claude/hooks/copy-to-clipboard.sh` is NOT tracked in the repo (same open question as `block-secret-literals.sh` / `announce-new-documents.sh`). Decide whether to commit/track so it syncs to the other Mac.
2. **Clipboard hook activation**: may need a `/hooks` reload or restart to be live this session (settings watcher only watches dirs that had a settings file at session start).
3. **notes** branch `transcripts/system-crafters` pushed but not merged to main.
4. **Stripe old-key retirement (life-ops#231, was due ~2026-06-24)**: confirm old `sk_live_…CimQ` expired and old webhook secret `whsec_…Ml3B` retired (last two open boxes, comment 4781297041). Local/dashboard check; with the Stripe MCP installed, verify via `mcp__stripe__*` or a dashboard glance.
5. **Stripe MCP**: launcher `~/.claude/bin/stripe-mcp.sh` reads `STRIPE_LIVE_SECRET_KEY` from `~/.secure_env_vars` at runtime (no secret in `~/.claude.json`). `mcp__stripe__*` tools load on session start. Full live key + `--tools=all` (can refund/charge live) — could scope to a restricted key later. Local-only, not synced.
6. **service_role**: consciously DEFERRED (zero JWT hits in any log). Don't rotate casually (logs out all LDC users + invalidates anon key).

## Next tractable work
- Discuss the System Crafters transcripts (user wants productivity improvements). Most on-point: "Wiring Claude Code Into Emacs" and "Crafting an AI-Driven Workflow System".
- As concrete "I'll try X" items surface from the transcripts, file each as a `life-ops` issue (`type:decision, tech-setup`) per the learn-and-try routing rule. Raw reference -> notes, commitments -> life-ops.
- Resolve life-ops#245 on the old MacBook.
- Optional: separate lower-priority `tech-setup` issue for a Keychain/1Password single-source-of-truth to kill the per-machine `.secure_env_vars` drift.

## Carried over (status UNVERIFIED, confirm before acting)
- **Sahil promoter half-done/uncommitted**: prod DB had promoter `unnaturaltm` + shift rows + ledger `20260619170000` but no migration file / no promoters.ts entry. Decide: roll back the 4 DB rows OR finish him. Paid ticket ($31.50) untouched.
- **Facebook unblock not live**: `~/projects/etc-hosts/hosts` edited but `/etc/hosts` unchanged. Run `bash ~/projects/etc-hosts/sync.sh` (sudo).
- **#528 board activation**: toggle Auto-add + Item-added→Backlog in Projects UI, then delete `.github/workflows/add-to-project.yml`.
- **Tax/legal Tier 4** (#452 HST, #454 QST): live exposure on tickets selling now.

## Hard-won lessons
- Do NOT apply le-day-club migrations via Supabase MCP `apply_migration` (version mismatch freezes prod deploys). Use `supabase db push`; confirm `gh run list --workflow=deploy.yml` green after a push. See [[ldc-migrations-no-mcp-apply]].
- `cp`/`mv` are aliased interactive in Pedro's shell: they prompt and silently no-op in non-interactive Bash. Use `cat > target` or `/bin/cp -f` when scripting overwrites.
