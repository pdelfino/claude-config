---
name: ldc_stripe_coupon_cli_key
description: Which Stripe key creates LDC coupons/promo codes via CLI (the WRITE_KEY name is a trap)
metadata: 
  node_type: memory
  type: reference
  originSessionId: 3f4fe4f5-c674-4497-bda3-5875bc9bf621
---

To create Le Day Club Stripe coupons or promotion codes from the CLI, use the
`STRIPE_LIVE_SECRET_KEY` (`sk_live_…`) from `~/.secure_env_vars`, passed as
`stripe <cmd> --api-key "$STRIPE_LIVE_SECRET_KEY"`.

The stripe CLI's stored config key is a restricted `rk_live_` with read-only
scope, and **`STRIPE_LIVE_WRITE_KEY` is ALSO a restricted `rk_live_` lacking
`coupon_write`** despite the name — both fail coupon/promo creation with
"Permission denied … coupon_write". Only the full secret key works.

Conventions (match `docSavedPedro` / `tchequinha`): coupon = `--percent-off N
--duration once -d "max_redemptions=K"`, then `stripe promotion_codes create
-d "coupon=<id>" -d "code=NAME" -d "max_redemptions=K"` (note: promotion_codes
create takes `-d` params, NOT `--coupon`/`--code` flags). Set max_redemptions
on BOTH coupon and promo code. The human code is the Stripe promotion code;
checkout worker has `allow_promotion_codes=true`. CLI `coupons delete` defaults
to TEST mode regardless of `--api-key` — pass with care.

Coupons are Stripe-side; the DB only references `stripe_coupon_id`
(`ticket_grants` table). See [[feedback_comp_vs_coupon]].
