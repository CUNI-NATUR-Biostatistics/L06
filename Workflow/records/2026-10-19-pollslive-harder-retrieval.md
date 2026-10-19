# L06 PollsLive retrieval quiz: harder replacement questions

- Date: 2026-10-19
- Branch: `pollslive-harder-retrieval`
- Workstream: focused post-presentation PollsLive revision
- Approver: Ondřej Mottl (human author)
- Decision: approved on 2026-10-19 in the authoring session, without requested revisions.

Integration-map status: unchanged and approved. Exact-question status: approved.

## Reason for the revision

After teaching L03 the author judged the retrieval questions far easier than the Moodle self-tests. The previous L06 set used the best-known p-value distractors, a type I error item whose stem was the definition, and a conclusion item whose correct answer was by far the longest. The new set asks for a computation that also checks the unit of observation, a p-value item in which all four readings sound plausible, and a transfer to a new small study.

## Integration map

The retrieval block keeps its approved position before `Výsledky učení`. No other slide changes.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Compute t from estimate and SE; residual df from the unit of observation | L05 t-statistic, df = n − 2, sites as units | The same test logic will compare group means. |
| Q2 | Read a p-value conditionally on H₀ | L05 null distribution and its tails | — |
| Q3 | Read a non-significant small study with its interval | L05 conclusion order, type II error, "absence of evidence" | Uncertainty, not a yes/no verdict, carries into group comparisons. |

## Exact production questions

The canonical text is `pollslive/quiz.json`.

| Question ID | Correct option | Key | Distractors and the misconception each encodes |
|---|---|---|---|
| `t-a-stupne-volnosti` | t ≈ 6; df = 11 | A | df = 390 (crabs as independent units); df = 13 (n instead of n − 2); t ≈ 0,16 with df = 390 (SE / estimate and crabs as units) |
| `vyklad-male-p-hodnoty` | conditional on H₀ | B | probability the result arose "by chance"; 1 − p as probability of Hₐ; replication probability |
| `mala-studie-zaver` | compatible with zero and with our slope | D | non-significance proves no association; significant vs non-significant means contradiction; wrong error type |

Changes from the approved proposal, kept within its meaning: at the author's request the Q1 output is rounded to two decimals (0,49 and 0,08) so that t ≈ 6 can be computed mentally; the exact t is 6,16. the Q1 numbers (13 sites, 392 crabs) appear in the evidence card rather than the stem. The Q3 numbers appear in the evidence card. Its p-value is 0,10 instead of the first-draft 0,12, because 0,10 is the value consistent with the estimate, SE and interval at df = 2.

Checked numbers (fresh R session): slope 0,4895 mm/° (SE 0,0795), t = 6,16, df = 11, p = 7,1 · 10⁻⁵; 13 sites, 392 crabs. Hypothetical study: estimate 0,45, SE 0,151, df = 2 gives 95% CI [−0,20; 1,10] and p = 0,097.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence in L05 |
|---|---|---|
| t = estimate / SE | yes | learning materials on the t-statistic; Moodle family `t-vypocet` |
| Residual df = independent observations − coefficients; the site, not the crab, is the unit | yes | learning materials on degrees of freedom and on the unit of observation |
| P-value is conditional on H₀ and is not P(H₀), P(chance) or replication probability | yes | learning materials and slide `p_hodnota_chvosty.png` |
| Non-significance does not prove no effect; type II error | yes | learning materials on decisions and errors |

## Evidence

| Asset | Source | SHA-256 |
|---|---|---|
| `l05-odhad-se-lokality.png` | rendered by `R/render_pollslive_assets.R` (printed coefficients without t, df or p) | `fe97bd59c9aa76a5f37c5a0f2fa10532b5e66c093338c63aacebab88ef1d92f4` |
| `l05-p-value-tails.png` | byte-identical copy of L05 `Presentation/Materials/p_hodnota_chvosty.png` (kept from the previous quiz) | `7d0af829f0e0accb6d93121748bbdef8af4b9c717b3f6694cc9555930b43621a` |
| `l05-mala-studie.png` | rendered by `R/render_pollslive_assets.R` (our L05 study beside the hypothetical small study) | `5928a8b42ce8081fe5fc3946956ba6e0e8066c4bc2b1f4909a11ce0bf69de593` |

The previous assets `l05-type-i-error.jpg` and `l05-effect-first-conclusion.png` are removed. The Q2 figure marks the observed t near ±6,2; it follows Q1, so it does not reveal the Q1 calculation before students answer it.

## Answer key and course balance

L06 key: A B D. The course-wide table is in L04 `Workflow/records/2026-10-19-pollslive-harder-retrieval.md`.

## Validation

- `node pollslive/validate.mjs`: passed without credentials.
- `Rscript R/verify_pollslive_assets.R`: passed.
- Offline render: see the review section.

## Review

Independent read-only review: completed on 2026-10-19 by a separate reviewer subagent (canonical prompt `.ai/agents/vision-corrector.md`, scoped to the retrieval block of L04, L05, L06, L07, L08 and L10; a capable general-purpose model, chosen because the task is a focused content review of 18 short items). No blockers: every keyed answer was confirmed correct, every distractor wrong, and the course-wide key balance verified.

Should-fix, resolved: in Q2 and Q3 the correct option was the longest and only hedged one; the distractors were lengthened and the Q3 correct option shortened. Q3 relied on our slope 0,49 that its card did not show; the card now places our L05 study beside the new one. Minor, resolved: in Q1 the correct option shared one component with every distractor, so the consensus option was correct; the last distractor is now `t ≈ 0,16; df = 390`.

Focused re-check of these corrections by the same reviewer: pending.

## Operational boundary

No staging, commits, pushes, live PollsLive operations, response submissions or activation changes were made.
