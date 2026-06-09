---
name: GST/HST registration active (RT0001) — 2026
description: Corp 15811856 Canada Inc. is registered for GST/HST effective 2026-04-09; annual reporter; first return covers Apr 9–Dec 31, 2026, due 2027-03-31
type: project
originSessionId: 64ec04f8-ddea-433a-88c5-0a8e05f2fb52
---
# GST/HST registration — 15811856 Canada Inc.

**Effective date:** 2026-04-09 (backdated to application date Pedro chose)
**Application submitted:** 2026-05-05 by Pedro himself via CRA MBA (`Register GST_HST account - details.pdf` + screenshots in `~/Downloads/`)
**Approval received:** 2026-05-08 (Registration confirmation notice email + letter)
**Program account:** 75536 7752 RT0001
**Reporting period:** Annual
**First return period:** 2026-04-09 to 2026-12-31, due 2027-03-31

## Why this is a status change

This **invalidates** the May 1 session handoff claim that "BN 755367752 has only
RC0001 + RZ0001 — NO RT0001 → no GST/HST surprises." The May 1 MBA check was
accurate at the time but pre-dated Pedro's May 5 application. The closure
of life-ops #87 (GST/HST verification) is now obsolete; reopen or supersede.

## Bookkeeping implications (starting 2026-04-09)

- **Output GST/HST**: Tallyfor invoices = export of services to non-resident
  US client, **zero-rated** under ETA Sch VI Part V s.7. No HST charged but
  supplies appear on return line 90 ("zero-rated supplies"). Confirm
  zero-rated treatment going forward; flag any invoice line that could be
  recharacterized as a domestic supply.
- **Input tax credits**: Now claimable on Canadian-source business expenses
  containing HST (Anthropic CAD-billed once migrated, BMO fees, software
  subscriptions, accountant/lawyer fees, etc.). Beancount needs an
  `Assets:GST-HST-ITC` account and a split on each post-April-9 expense
  with HST.
- **Net tax = output (likely $0) − ITCs**. Likely a refund every year.
- **Quarterly instalments**: not required (need ≥$3,000 net tax in first
  AND second year; refund position fails the test).
- **Retroactive April 9 → today**: all already-booked 2026 expenses with
  HST need to be re-split to extract the ITC portion. Open a life-ops
  issue.

## Direct deposit

Enrolled 2026-05-08 18:16–18:17 on all three program accounts (RC0001,
RZ0001, RT0001), same BMO Business chequing **04432-0001-1979108**
(Yonge & Roselawn, Toronto). Confirmation PDFs in `~/Downloads/`. Refunds
on any program account will land in corp BMO chequing.

## Open follow-ups

1. **Address mismatch**: CRA still mails to 15 Roehampton Ave, Toronto.
   Update CRA business address to QC via MBA when QC address is finalized
   (sanitize-canadian-life.org #49).
2. **Past-period exposure (small)**: Tallyfor revenue likely crossed the
   $30K small-supplier threshold well before April 9, 2026 (zero-rated
   supplies still count). CRA could in principle backdate registration to
   the threshold-crossing date. Net liability remains $0 (zero-rated
   outputs) but books extend further back. Not urgent. Be ready to answer
   if CRA asks.
3. **TALLYF-0028 onward** invoice template: add explicit
   "GST/HST: $0.00 (zero-rated export of services per ETA s.7)" line for
   audit trail clarity.
