# L06 exercise polish: blueprint and validation

## Status and decisions

- Date: 2026-10-09.
- Branch: `polish/l06-review-fixes`, created on explicit user authorization ("make a single new branch and do all edits on it") from clean `main` at `ebf6da3`. The same branch carries the learning-material and presentation polish.
- Trigger: Ondřej Mottl asked for a full review of L06 against the guidance and the L02/L05 style; the review found that the exercise still used the September format. Decision (2026-10-09): "Exercise: fully restyle".
- Supersedes: [2026-09-22 exercise blueprint](2026-09-22-exercise-blueprint.md) (historical approval retained there).

## Changes against the September worksheet

- Structure follows L04/L05: `Příprava` with „Jak získat a otevřít soubory“ (numbered steps, Existing Directory, Save As, box-drawing folder tree), „Jak se skriptem pracovat“, „Výsledky učení a předpoklady“ (the shared lesson outcomes), „Technická kontrola souboru“ (`paste0()` message, variable dictionary with units and source). One `# Úlohy navíc` section with `##` groups; closing „Ohlédnutí a vlastní kontrola“.
- Task anatomy: numbered `Zadání`, empty answer lines, separate `Očekávaný výsledek`, `Nápověda 1`, `Nápověda 2` and `Interpretace`; new functions (`factor()` levels, `!is.na()` row selection, `stripchart()`, `tapply()`, `%in%`, `droplevels()`, `t.test()`, `lm(y ~ 1)`, sums of squares, `emmeans`, `relevel()`, `pf()`) are explained before first use; commented examples to copy.
- No lesson codes in student prose; post-hoc wording follows the softened lesson text (Tukey needs no prior significant F).
- Corrections: the U05 (old U04) expected p-value no longer cites 8.03e-68, which neither `summary()` nor `t.test()` prints; the residual-band description matches the base-R plot.
- Task IDs: the practical has not been taught yet, so the main route was renumbered to follow the lesson order, as in L04. Mapping: old U01 → U01 (data) + U02 (graph and group summaries); old U02 → U03; U03 → U04; U04 → U05; U05 → U06; old U08 diagnostics → U07 (now before the overall test, as in the lesson); old U06 → U08 (extended with SSE of the one-mean and three-mean models, read against the `anova()` Sum Sq column); U07 → U09; old U08 conclusion → U10. Old N01–N04 keep their IDs and content; N05–N13 are new (N13: mean squares and F by hand, moved out of U08 after the independent review).

## Outcomes, starting states and timing (120-minute practical)

| Segment | Purpose | Starting state | Direct work |
|---|---|---|---:|
| Příprava | Obtain files, open project, run the file check | RStudio, browser, release links | 10 min |
| L06-U01 | Load, inspect (`str`, `summary`, `colSums(is.na())`), drop missing mass, factor with fixed levels; outcome 1 | `soubor_tucnaci`; factor example above the task | 9 min |
| L06-U02 | Strip chart and group means/SDs before any model | `data_tucnaci`; commented plot example, `tapply()` form | 8 min |
| L06-U03 | Two-species model; reference and difference; outcome 1–2 | `data_tucnaci`; `%in%`, `droplevels()`, worked A/B example | 8 min |
| L06-U04 | Fitted values, residuals, CI of the difference; outcome 2 | `mod_dva_druhy` | 8 min |
| L06-U05 | Coefficient test equals equal-variance t-test; outcome 3 | `mod_dva_druhy`, `t.test()` form shown above | 7 min |
| L06-U06 | Three-species model, both reference contrasts; outcome 1–2 | `data_tucnaci` | 7 min |
| L06-U07 | Residual plots before testing | `mod_tri_druhy`; function list above | 8 min |
| L06-U08 | One mean vs three means: SSE of both models, located in `anova()`; F, df, p; H0; outcome 3 | `mod_tri_druhy`; definitions above | 8 min |
| L06-U09 | Tukey-adjusted pairwise comparisons; outcome 4 | `mod_tri_druhy`; `emmeans` preflight | 9 min |
| L06-U10 | Effect-first written conclusion with limits; outcome 5 | Results of U02–U09 | 9 min |

Total direct work: about 91 minutes (author estimate), within the 85–95 minute budget, leaving about 29 minutes for explanation, discussion and slower groups. The refresher of the previous lessons is skippable. The optional bank (N01–N13) is independent practice: reference change, Adélie–Chinstrap two-group model, SD versus mean differences, species × island and missing sex, Welch test, `pf()`, residual sums per group, emmeans means versus differences, unadjusted versus Tukey intervals, numeric predictor recap, transfer to `ostrov`, F = t² for two groups, and mean squares and F by hand.

Out of scope: models with more than one predictor, interactions, contrast coding beyond a reference change, Welch ANOVA, nonparametric tests, Tukey-distribution theory.

## Validation (author)

- UTF-8 without BOM or replacement characters; the file parses; task IDs U01–U10 and N01–N13 are unique. No `library()`, `require()`, `setwd()`, `attach()`, `View()`, `par()` or `T`/`F`; the only install command is commented. Lesson codes appear only in task IDs, the project folder name and URLs.
- The unfilled script sources from a clean `Rscript --vanilla` session in a temporary project with only `data/palmer_penguins.csv`; without the CSV it stops with the intended Czech message.
- An untracked reference harness (scratchpad, outside the repository) solved all main and optional tasks and produced every stated value: 344 rows; 2 missing masses, 11 missing sex; range 2 700–6 300 g; 342 kept (151/68/123); means 3 700,7 / 3 733,1 / 5 076,0 g, SDs 459 / 384 / 504 g; two-group model 274 rows, 3 700,7 and 1 375,4 g, CI 1 260,7–1 490,0 g, first residual 49,3 g; t = 23,61, df = 272, printed p `<2e-16` and `< 2.2e-16`; three-group coefficients 32,4 (CI −100,4–165,2) and 1 375,4 g; common mean 4 201,8 g; SSE 219 307 697 and 72 443 483 g²; MS 73 432 107 and 213 698 g²; F(2, 339) = 343,63; Tukey contrasts 32,4 (−127–191, p 0,881), 1 375,4 (1 243–1 508), 1 342,9 g (1 178–1 507); relevel coefficients −1 375,4 and −1 342,9 g with unchanged fitted values; Adélie–Chinstrap model CI −93,4–158,2 g, p 0,612; island counts and missing sex 5/0/4; Welch t 23,39, df 249,6, CI 1 259,5–1 491,2 g; pf p ≈ 2,9 · 10⁻⁸²; residual sums 0; emmeans means and intervals; unadjusted CI −100–165 g, p 0,631; flipper model −5 780,8 and 49,7 g/mm; island model 4 716,0 / −1 003,1 / −1 009,6 g, F = 110,0; F = 557,6 = t².
- The base-R residual plot was inspected: the Adélie and Chinstrap bands sit side by side on the left, Gentoo on the right; the expected result describes this.

## Independent review

A separate read-only reviewer applied `_internal/.ai/agents/exercise-reviewer.md` to the complete worksheet, sourced it from a clean session and re-solved every task in its own temporary harness; all stated values matched except one. Findings and resolutions:

- N11 interpretation wrongly said that all Biscoe penguins are Gentoo → now „Všichni tučňáci oslí žijí v datech na Biscoe“.
- Timing: the reviewer estimated 105–115 minutes for an average group against the author's 93. Mean squares and F by hand moved from U08 to the new optional N13 (U08 now 8 min, total about 91). The remaining gap is recorded below as an open pacing question for the course owner.
- `requireNamespace()` and `stripchart()` now use named, vertical arguments.
- Hints that repeated `Zadání` or assembled the full call (U01, U02, U10, N05, N07, N09, N10) were rewritten as reasoning cues.
- Prerequisites moved out of hints: the divisor 2 is explained in the N13 text; `all.equal()` is named and explained in the N01 `Zadání`.
- Czech wording (N01, U01 hint), N03 now cites U06 and U09, the U07 interpretation refers to the same island and the U07 introduction defines independence; the U05 expected result no longer shows a subtraction of rounded means; the U10 introduction states the species-by-island pattern it relies on.
- Not changed: the `emmeans` object names (`prumery_druhu`, `post_hoc_druhy`) match the lesson; the reviewer classed this as a preference.

After the fixes the script sourced again from a clean session.

## Remaining gates

- Human approval: given by Ondřej Mottl on 2026-10-10 („I approve learning materials, presentation and R script“). Approval does not authorize staging, commits, pushes, a pull request or a release.
- Beginner GUI pacing trial: author estimate about 91 minutes, independent reviewer estimate 105–115 minutes. If a dry run confirms the higher figure, candidates to move to Úlohy navíc are the U07 Q–Q plot or U04 step 2.
