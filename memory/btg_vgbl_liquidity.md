---
name: btg-vgbl-liquidity
description: "BTG Brazilian pension (VGBL regressivo) is D+1 liquid, not locked — count it as liquid in net-worth/runway analysis"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 5e95c55a-92d9-4fda-b2d6-0367566b5f13
---

Pedro's BTG Pactual previdência (~R$482k ≈ CAD 132k, 2026-06) is a **VGBL regressivo**. It withdraws in **1 business day (D+1)** — it is **liquid**, not locked. As a non-resident (living outside Brazil), access/tax treatment is *easier*, not harder. VGBL taxes only the **gains** on withdrawal (regressive table, rate falls with holding time to a 10% floor after 10 years), unlike PGBL which taxes the whole amount.

So in any net-worth / FIRE / runway analysis, count BTG as **LIQUID**. Liquid net worth ≈ **CAD 237k** (Canada directly-held ~105k + BTG ~132k), NOT just the ~105k Canada-direct. The corp (~146k) is the tier with real friction (dividend/salary extraction, ~30% tax), and angel/receivables are the illiquid tail.

Don't repeat the earlier wrong assumption that the Brazilian pension is locked up. See WEALTH.org "Liquidity tiers". Related: [[anthropic_accounts]] is unrelated; the wealth picture lives in life-admin `personal/beancount/WEALTH.org` + `tools/runway.py`.
