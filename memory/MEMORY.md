# Memory

## Voyage project (balance/bases/voyage)
- **Logback version**: Must use `logback-classic 1.2.x` (not 1.4.x). WunderBoss 0.13.1 (via luminus-immutant) depends on logback 1.1.x internally. Logback 1.4.x breaks WunderBoss static initialization with `NoClassDefFoundError`. Logback 1.2.13 works with SLF4J 2.0 via legacy static binder fallback.
- **Test failures**: 3 tests (rest_api_lifecycle_test, rest_api_test, test.handler) always fail locally due to missing Firebase credentials — pre-existing, not regressions.
- **lein test** is run from `bases/voyage/` directory.

## User
- [Anthropic accounts and API keys](anthropic_accounts.md) — personal vs Tallyfor org IDs + named env vars in `~/.secure_env_vars`

## Session handoff
- [Rolling session handoff](project_session_handoff.md) — what shipped last session, what to verify, what's next
