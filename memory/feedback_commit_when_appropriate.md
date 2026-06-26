---
name: feedback_commit_when_appropriate
description: "Commit when you judge it appropriate — don't wait to be asked each time"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a327c3db-e090-4f46-918e-f4386ac24341
---

Pedro lifted the "commit only when asked" default. Commit whenever you judge it appropriate — finished, coherent unit of work that belongs in version control.

**Why:** He trusts the judgment and doesn't want to be pinged for permission on every obviously-commit-worthy change. Said it explicitly on 2026-06-24 after the Renata therapy audit: "Mude a regra. Commite quando vc achar apropriado!"

**How to apply:**
- After completing a self-contained change (filed receipts, a written report, a fix), stage just the relevant files and commit with a clear message. No need to ask first.
- Still respect repo norms: commit to the branch the repo normally uses (e.g. life-admin commits straight to `main` — see its git log). If on a default branch in a repo that uses PR branches, branch first.
- Stage selectively — don't sweep in unrelated dirty files (leave others' working files alone).
- Keep the Co-Authored-By trailer on commit messages.
- **Push** still warrants a heads-up unless he's said otherwise; this rule is about local commits.
- Secrets never go in commits (see [[feedback_never_echo_secrets]]).
