---
name: feedback-comp-vs-coupon
description: "LDC free-ticket policy, $0 comp grants vs shareable discount codes are for different audiences"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a3721988-5260-4491-9423-23ec02d1587b
---

Two distinct mechanisms for "free/discounted LDC ticket," not interchangeable:

- **$0 comp grant** (public.ticket_grants, kind='comp' → skip Stripe, $0 voucher): RESERVED for people who EARNED it, e.g. the promo-video shoot helpers. It's recognition for contribution, per-email, hard-scoped to the event, no code.
- **Shareable discount/free code** (Stripe promotion code, e.g. `docSavedPedro` = 100% off, capped redemptions): for casual / outreach invites, e.g. people Pedro met at a party. A code he hands out, not tied to a specific email.

**Why:** comps honor contributors; codes are a marketing/invite tool. Mixing them up (comping a casual invite, or making a contributor type a code) misses the intent.

**How to apply:** when Pedro says "make it free for X," classify first. Contributor/helper → comp grant. Casual invite / promo → coupon code. Set 2026-06-15. Stripe coupon mechanics + caveats live in le-day-club#498 and the checkout worker.
