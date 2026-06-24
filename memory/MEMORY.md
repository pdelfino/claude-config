# Memory

## Voyage project (balance/bases/voyage)
- **Logback version**: Must use `logback-classic 1.2.x` (not 1.4.x). WunderBoss 0.13.1 (via luminus-immutant) depends on logback 1.1.x internally. Logback 1.4.x breaks WunderBoss static initialization with `NoClassDefFoundError`. Logback 1.2.13 works with SLF4J 2.0 via legacy static binder fallback.
- **Test failures**: 3 tests (rest_api_lifecycle_test, rest_api_test, test.handler) always fail locally due to missing Firebase credentials — pre-existing, not regressions.
- **lein test** is run from `bases/voyage/` directory.

## User
- [Anthropic accounts and API keys](anthropic_accounts.md) — personal vs Tallyfor org IDs + named env vars in `~/.secure_env_vars`
- [Canadian immigration / corp status](user_canadian_status.md) — PR working toward citizenship, federal corp 15811856, recent ON→QC move

## Repos & routing
- [Where to file ideas vs commitments](repo_routing_for_ideas.md) — notes = exploratory superset; life-ops = commitments; ideias is archived
- ["Learn and try X" → life-ops](feedback_routing_learn_and_try.md) — specific named tool/repo to try is a commitment, not exploration

## Decisions
- [Solo filings 2026](decisions_solo_filings_2026.md) — no CPA on Canadian taxes, no lawyer on LDC waiver (as of 2026-05-08)
- [OAB cancellation](oab_cancellation.md) — OAB-RJ nº 230465 cancellation FILED 2026-06-11, protocol 19.0000.2026.034286-9 (life-ops#228, absorbed #41); card declared extravio so no physical return; watch for deferimento, then close #228

## Corp tax accounts
- [GST/HST registration active 2026](gst_hst_registration_2026.md) — RT0001 effective 2026-04-09; first return due 2027-03-31; ITCs claimable

## Personal tax (T1)
- [$150 unallocated CRA credit](cra_150_unallocated_credit.md) — overpaid 2026-05-01 on purpose; leave it to offset the 2026 T1, verify it applied when filing (early 2027)

## Le Day Club ops
- [Comp grants vs coupon codes](feedback_comp_vs_coupon.md) — $0 comps (ticket_grants) are for earned contributors (promo-video helpers); shareable codes (docSavedPedro) are for casual/outreach invites
- [Don't apply LDC migrations via Supabase MCP](ldc_migrations_no_mcp_apply.md) — `apply_migration` records a mismatched version that fails the deploy guard and silently freezes prod; use `supabase db push`
- [Stripe coupon CLI key](ldc_stripe_coupon_cli_key.md) — create coupons/promo codes with `STRIPE_LIVE_SECRET_KEY` (sk_live); the rk_live keys incl. STRIPE_LIVE_WRITE_KEY lack `coupon_write`

## Style & preferences
- [Sign emails "Pedro Delfino, Imagineer"](feedback_email_signature.md) — always, on any email Claude drafts (members, lateness, support, Gmail drafts)
- [XKCD stays in illustrations](feedback_xkcd_contained.md) — no sketch borders/grain/draw-in or full-bleed color bands in LDC UI chrome; serif headings + one entrance animation is the approved boldness
- [No blockquotes ever](feedback_no_blockquotes.md) — `>` renders as `▎` bars in his terminal and corrupts copy-paste; paste-able text goes in ```text fences
- [No em-dashes](feedback_no_em_dashes.md) — treats them as an AI tell; use periods/commas/parens, ` · ` to join titles
- [No issue assignees](feedback_no_issue_assignees.md) — never assign pdelfino to life-ops/le-day-club issues; assignment is implicit
- [Never echo secrets](feedback_never_echo_secrets.md) — no secret literals in commands/Write/slap-temp; read from $VAR and pipe via stdin; guard hook blocks them (life-ops#231)

## Session handoff
- [Rolling session handoff](project_session_handoff.md) — what shipped last session, what to verify, what's next
