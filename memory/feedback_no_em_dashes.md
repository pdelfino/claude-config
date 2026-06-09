---
name: feedback-no-em-dashes
description: "Pedro dislikes em-dashes in all writing; treats them as an AI tell. Use periods, commas, parentheses, or colons instead."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 877d8284-4d4c-4243-9c40-b4770fc40472
---

Never use em-dashes (—) in anything written for Pedro: chat responses, GitHub issues, commits, docs, code comments.

**Why:** He considers em-dashes an AI tell and has enforced this repeatedly. The le-day-club repo even has a CI guard (`bin/check-no-em-dash.sh`), and titles there join with ` · ` (middle-dot) rather than a dash.

**How to apply:** Reach for periods, commas, parentheses, or colons. If joining two title fragments, use ` · `. Applies across every project, not just le-day-club. Encoded in the [[gh-issue]] skill's style rules too.
