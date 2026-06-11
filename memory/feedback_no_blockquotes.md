---
name: feedback-no-blockquotes
description: "Never use markdown blockquotes, the terminal renders a bar that breaks Pedro's copy-paste"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a3721988-5260-4491-9423-23ec02d1587b
---

Pedro (2026-06-11, angrily): markdown blockquotes (`>`) render in his terminal with a `▎` bar on every line, and copying grabs the bars, so pasted text is mangled. He had to clean up a justificativa I drafted for an OAB form.

**Why:** He copies drafted text (form fields, emails, legal boilerplate) straight from the terminal into websites. Any per-line decoration corrupts the paste.

**How to apply:** Never output `>` blockquotes for anything. Paste-able prose goes in a fenced code block (```text). Quotes from people/documents go in italics or inline quotation marks. Rule is also codified in the global CLAUDE.md ("NEVER use markdown blockquotes"). Same spirit as [[feedback-no-em-dashes]] and the slap-temp single-line command rule.
