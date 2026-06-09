---
name: "learn and try X" goes to life-ops, not notes
description: route "learn and try [tool]" / "investigate [tool]" requests to life-ops as type:decision, not to notes — the user treats tool-trial as a commitment, not exploration
type: feedback
originSessionId: 8eacac3b-bb29-49ec-99fb-7849cad67bc8
---
When the user says "learn and try [tool]", "investigate [tool]", or otherwise frames a concrete tool/tech trial they intend to actually do — file in **`pdelfino/life-ops`** with `tech-setup, type:decision` (add `meta` if it interacts with claude-ops or assistant infrastructure), **not** in `pdelfino/notes`.

**Why:** On 2026-05-06 I filed "learn and try open-claw" in `pdelfino/notes` reasoning that "learn and try" sounded exploratory. User corrected: *"the open-claw thing should be on life-ops, actually"*. The pattern: trying a specific named tool is a commitment to do something, not just an idea to capture. Notes is for genuinely speculative ideas ("should I learn lisp someday?", "what would a beancount rewrite look like?"); life-ops is for "I want to actually try this thing."

**How to apply:** the existing routing memory says exploratory → notes, commitments → life-ops. The discriminator: is the user pointing at a specific *named artifact* (a repo, a tool, a service) they intend to install/use? → commitment → life-ops. Generic exploration ("ideas about X domain") → notes. When the user attaches a URL to a specific project, that's almost always a life-ops signal.
