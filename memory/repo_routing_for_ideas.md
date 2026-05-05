---
name: where to file ideas vs commitments
description: route exploratory ideas to pdelfino/notes (superset of ideas); commitments to pdelfino/life-ops; ideias repo is archived
type: project
originSessionId: f47dd225-4c76-4606-af1b-52a4db2eb4ea
---
When the user asks to file an issue about an idea, exploration, or "should I do X" question:

- **`pdelfino/notes`** — the superset for exploratory ideas, research notes, and "thinking out loud." User confirmed 2026-05-05: *"notes is the super-set of ideas."* Default labels only (use `question` for exploratory items).
- **`pdelfino/life-ops`** — for committed/actionable items. Has rich label set (`type:errand`, `type:project`, `type:decision`, `type:habit`, `type:activity`, plus topic labels and urgency labels `this-week`/`this-month`).
- **`pdelfino/ideias`** — **archived/read-only** as of 2026-05-05. `gh issue create` against it fails with `GraphQL: Repository was archived so is read-only`. Do not try to file there.

**Why:** user wants notes vs life-ops to stay separated by commitment level, not by topic. Filing exploratory ideas on life-ops pollutes the actionable backlog.

**How to apply:** if the user says "ideas," "ideias," "exploration," "research note," or asks to capture a possibility/feasibility question → notes repo. If they say "todo," "task," "errand," or describe a concrete commitment with implied deadline → life-ops. When ambiguous, ask. If the user explicitly names one of the repos, follow that even if it seems mis-routed (they know their own system).
