---
name: Going solo on Canadian taxes + LDC waiver (2026-05-08)
description: Pedro is filing T1/T2 without a CPA and shipping the bilingual LDC waiver without lawyer review — don't propose either professional engagement
type: project
originSessionId: 64ec04f8-ddea-433a-88c5-0a8e05f2fb52
---
# Solo filings, 2026-05-08

Pedro stated 2026-05-08 he's going without a CPA on his Canadian
personal + corporate taxes (T1 2025, T2 FY2024 catch-up, T2 FY2025,
**and now GST/HST returns** — see `gst_hst_registration_2026.md`,
RT0001 went active 2026-04-09 with first return due 2027-03-31)
and without a lawyer on the bilingual Le Day Club waiver before
Demo #0 on 2026-05-23.

**Why:**
- T2 FY2024 prepayment ($15,200 CAD on 2025-04-23) and FY2025
  prepayment ($12,700 on ~2026-04, commit `476ac1a`) cap arrears
  interest exposure to ~$100. Late-filing penalty = $0 because both
  prepayments cleared before the filing deadline.
- Pedro's beancount books are extensive (sanity checks 13/15 PASS,
  TaxTron working paper at `life-admin/.../FY2025 T2 prep`),
  bringing the marginal value of a CPA down toward zero on this
  fact pattern.
- The waiver is bilingual and already shipped (`make
  waiver-bilingual`); a lawyer review was nice-to-have, not gating
  Demo #0.

**How to apply:**
- Drop `life-ops#62` (was: accountant brief to Gurpreet/Hawley
  Chatwal). Don't recommend chasing her for a reply.
- Drop `ldc#8` (lawyer review on bilingual waiver before May 23).
  Don't list it in Demo #0 critical chains.
- Don't propose new CPA outreach for FY2026 by default — Pedro will
  ask if he changes his mind. If proposing a CPA is genuinely the
  right call (e.g. a future audit, complex T1135, dispute with
  CRA), flag it explicitly as a reversal and explain why.
- The accountant brief email Pedro sent 2026-05-01 17:06 EDT to
  `gurpreet@hawleychatwal.com` is now a non-action item.

**Status of the qualifier "I think I will":** Pedro hedged at the
moment of stating the decision; he hasn't formally closed
`life-ops#62` or `ldc#8`. Treat as the working decision but let him
close the issues himself.
