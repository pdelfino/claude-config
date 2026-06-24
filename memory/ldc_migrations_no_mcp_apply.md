---
name: ldc-migrations-no-mcp-apply
description: Do NOT apply le-day-club DB migrations via the Supabase MCP; it breaks the deploy guard
metadata: 
  node_type: memory
  type: project
  originSessionId: 3987bd01-2703-4df3-b046-2d51b50cd875
---

In the `le-day-club` repo, do not apply migrations with the Supabase MCP `apply_migration` tool when the migration also lives as a file in `supabase/migrations/`.

`apply_migration` records the migration in remote history under an AUTO-GENERATED version timestamp (e.g. `20260619010230`), NOT the filename's timestamp (e.g. `20260618210000`). Then `bin/check-unpushed-migrations.sh` (runs in `deploy.yml` BEFORE the build) calls `supabase migration list --linked`, sees the local file as having a blank remote column, and FAILS the deploy. The SQL is actually applied (rows/functions exist), but every deploy is blocked until the version mismatch is fixed, so prod silently freezes on the last good commit.

**This happened 2026-06-18:** the Rhami promoter add + the `includes_comp_ticket` comp-ticket fix were applied via MCP. Prod was stuck 2 commits behind for ~25 min; Pedro kept seeing the un-fixed contract on prod. Fix that worked: `git mv` the local migration files to the exact versions `apply_migration` recorded in `supabase_migrations.schema_migrations`, then push (CI passes).

**Going forward:** apply le-day-club migrations via `supabase db push` (so file version == recorded version), or `supabase migration repair --status applied <version>` to reconcile. Reserve the Supabase MCP for read-only queries (`execute_sql` selects), not `apply_migration`. After any prod push, check `gh run list --workflow=deploy.yml` is green. Related: [[project_session_handoff]].
