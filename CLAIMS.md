# Claims on the poster and where they come from

Source of truth: Kolesnichenko et al., *SONIC-K1*, arXiv:2610.39327 **v3** (5 Nov 2026).
G1 numbers: Luo et al., *SONIC*, arXiv:2511.07820, as quoted in SONIC-K1 Table II.

| Claim on poster | Value | Source |
|---|---|---|
| Training compute | ~145 GPU-h = 135.4 h (H100) + 9.2 h (RTX PRO 6000) | Sec. III-B, Table I |
| "under 1% of SONIC's compute" | 145 / 21,000 GPU-h (128 GPUs over 7 days) ≈ 0.7% | SONIC paper, abstract + Sec. 2.1 (SONIC-K1 Table I says ~3 days: outdated) |
| Held-out success | 97.4% (1,985 clips, MuJoCo, SONIC rule, v0.1) | Table II |
| PHUMA / 100STYLE / LAFAN1 | 93.6 / 99.0 / 70.6% | Table II |
| G1 held-out / PHUMA (reported) | 98.5 / 97.2% | Table II, right side |
| No-fall Isaac Lab vs MuJoCo | 98.7 vs 98.4% | Sec. IV-A |
| 10 → 9,991 training clips | 63.6 → 93.1% (official rule) | Sec. IV-A |
| Robustness sweep | ≥98.0 for gains, strength, payload, noise, caps; pushes 97.0; 20 ms 98.5; 40 ms 56.0 | Sec. IV-B, Fig. 3 |
| Knee torque training vs robot | 112 vs 40 Nm | Sec. V |
| Post-training, held-out | 97.5→97.4, 95.5→97.1, 76.7→96.6 | Table III |
| Post-training at 40 ms | PHUMA 78.0→91.7; Isaac official 70.4→89.4 | Table III |
| Leg jitter (deg) | yawn 0.038→0.032, squat 0.202→0.140, lunge 0.597→0.365 | Table IV |
| Torque-capped ticks (lunge) | 8.1 → 1.1% | Table IV |
| Leg velocity power above 4 Hz (lunge) | 29 → 10% | Table IV |
| Walks and turns without leg shaking | "in our runs" | Sec. V, Real robot |
| Data | 142,220 → 62,427 feasible → 9,991 train / 1,985 held out | Sec. III-A |
| Model | 25.1 M-parameter actor, 50 Hz policy, 16,384 envs | Sec. III-B |
