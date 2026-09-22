# L06 exercise blueprint

## Status and teaching boundary

- Date: 2026-09-22
- Branch: `lesson/l06-exercises`, created from clean `main` after the approved presentation was merged
- Sources: approved L06 written lesson and presentation, `_internal/osnova_lekci.md`, and the L05 practical
- Human exercise approval: Ondřej Mottl, 2026-09-22; approved the completed worksheet with no requested revisions
- Independent exercise review: full review and focused worked-example re-review reported no findings

The 90-minute practical has a planned 68-minute direct-work route: 10 minutes for project and file preparation, then 58 minutes for U01–U08. About 22 minutes remain for explanation, discussion, and slower groups. The same public script must also work for self-study. Teacher transitions and pacing cues belong here, not in the student worksheet.

## Outcomes, prerequisites, starting states, and timing

| Segment | Purpose and L06 outcome | Starting state and knowledge | Direct work |
| --- | --- | --- | ---: |
| Preparation | Obtain the script and approved CSV, open an RStudio Project, and check the relative path. | L05 project and CSV workflow; direct download instructions remain visible for independent study. | 10 min |
| L06-U01 | Load and inspect the 344 penguins, identify two missing body masses, retain 342 usable rows, and show individual masses by species; outcome 1. | Open project and CSV preflight; L05 `read.csv()`, `nrow()`, `table()`, `is.na()`; introduce `stripchart()` and factor order immediately before use. | 8 min |
| L06-U02 | Select Adélie and Gentoo, fit `lm(hmotnost_tela_g ~ druh)`, and interpret the reference mean and group difference; outcome 1. | `data_tucnaci` from U01; familiar `lm()` and `coef()`; introduce `droplevels()` before use. | 8 min |
| L06-U03 | Reconstruct both fitted means, connect residuals to group means, and read the ordinary confidence interval for the difference; outcomes 1–2. | `mod_dva_druhy` from U02; L04–L05 `fitted()`, `resid()`, `confint()`. | 7 min |
| L06-U04 | Connect the two-group coefficient t statistic to the equal-variance two-sample test; outcome 2. | Two-group model; L05 hypothesis-test and p-value interpretation; explicit `t.test()` group order and `var.equal = TRUE`. | 6 min |
| L06-U05 | Fit the same formula to three species and interpret both reference contrasts; outcome 1. | `data_tucnaci` from U01; two-group reference interpretation. | 6 min |
| L06-U06 | Use `anova()` for the overall equal-means question and read F, degrees of freedom, and p; outcome 2. | `mod_tri_druhy` from U05; model residuals and within-group variability. | 6 min |
| L06-U07 | After the overall test, use `emmeans` and Tukey-adjusted contrasts to interpret three pairwise intervals; outcome 3. | `mod_tri_druhy` from U05; `emmeans` package preflight; the approved lesson's `emmeans::emmeans()` and `emmeans::contrast()` sequence. | 8 min |
| L06-U08 | Inspect residuals and write an effect-first biological conclusion with uncertainty and observational limits; outcomes 1–3. | U01–U07 outputs; L04–L05 residual checks and cautious inference. | 9 min |

The L05 inferential refresher and the visual explanation of fitted values are skippable when students already know them. Project and download instructions are permanent because the practical uses a local CSV. U01 and U02 intentionally require students to create the data and first model objects themselves; all later tasks name those dependencies explicitly.

## Dataset, dependencies, and scientific boundaries

- Main input: `data/palmer_penguins.csv`, the approved CC0 teaching table prepared from `palmerpenguins::penguins` version 0.1.1. Each row is one measured Palmer Archipelago penguin; the CSV has 344 rows, with two missing `hmotnost_tela_g` values. The analysis has 342 observations: Adélie 151, Chinstrap 68, Gentoo 123.
- The student script uses base R plus the namespaced `emmeans` functions already taught in L06. It never installs or attaches a package, changes the working directory, or depends on hidden objects. Its unfilled version must source with the CSV and `emmeans` available.
- Factor levels are explicitly `Adelie`, `Chinstrap`, `Gentoo`; Adélie is the reference for both models. The two-group comparison uses Adélie and Gentoo; `droplevels()` removes the unused Chinstrap level.
- Reference values to validate after drafting: group means about 3700.7, 3733.1, and 5076.0 g; two-group Gentoo minus Adélie estimate 1375.4 g with ordinary 95% CI 1260.7–1490.0 g, `t = 23.61`, `df = 272`, and `p ≈ 8.03e-68`. The equal-variance `t.test()` must use Gentoo as `x` and Adélie as `y` to preserve this positive direction.
- Three-group ANOVA: `F(2, 339) = 343.63`, `p < 2.2e-16`. Tukey contrasts: Chinstrap minus Adélie 32.4 g, simultaneous interval about −127 to 191 g, adjusted `p ≈ 0.881`; Gentoo minus Adélie 1375.4 g, interval about 1243–1508 g; Gentoo minus Chinstrap 1342.9 g, interval about 1178–1507 g.
- The overall F-test asks whether all species means are equal. Reference coefficients answer only comparisons to Adélie. Tukey contrasts answer all three pairwise questions, with intervals and p-values adjusted for their family. An interval crossing zero does not establish that two species are identical.
- These are observational measurements. Species and island are partly inseparable in the sample, sex also relates to mass, and residual graphs cannot prove independent sampling or causation. The conclusion is about the sampled Palmer Archipelago community, not every penguin of these species worldwide.
- Out of scope: multiple-predictor or adjusted models, interactions, alternative contrast coding beyond a reference change, detailed sums-of-squares algebra, Tukey-distribution derivation, and nonparametric-test catalogues.

## Optional practice and facilitation

| Task | Purpose and exact starting state | Estimated work |
| --- | --- | ---: |
| L06-N01 | Change the reference of `data_tucnaci$druh` to Gentoo in a new data object, refit the one-predictor model, and compare coefficients and fitted means; uses U01 and U05 objects. | 7 min |
| L06-N02 | Interpret the Chinstrap minus Adélie Tukey interval crossing zero without claiming equality; uses `post_hoc_druhy` from U07. | 5 min |
| L06-N03 | Compare within-species SDs with the three mean differences and explain why an F-test is not a measure of grams; uses `data_tucnaci` from U01. | 6 min |
| L06-N04 | Cross-tabulate species by island and inspect missing recorded sex, then name the scientific limitation without fitting another model; uses `data_tucnaci` from U01. | 7 min |

Teachers may recall the L05 effect-first conclusion before U03, ask for a prediction about the reference mean before U02, and contrast the overall and pairwise questions before U07. Optional tasks are a selection bank, not a requirement for the 90-minute session.

## Validation and review gates

Before human review: parse and verify UTF-8 without BOM; source the unfilled script in a fresh temporary project with the CSV; solve U01–U08 and N01–N04 in an untracked reference harness; verify numbers, group-order sign, intervals, sourceability, plots and Czech labels; rehearse download-to-first-task instructions; inspect first uses and prohibited patterns; and assess core timing. Assign the complete worksheet and blueprint to a separate read-only reviewer using `_internal/.ai/agents/exercise-reviewer.md`, then resolve findings and rerun affected checks.

The current public release manifest lists `exercises: []`. After explicit human approval of the exercise, the release workflow must add the approved script to the manifest and verify its stable download route. The worksheet may name that intended route, but it must not be described as live before publication.
## Completed validation and review

- The unfilled worksheet parses, is valid UTF-8 without BOM or replacement characters, and sources from a clean R session in a temporary project with the approved CSV. Its only independent worked model returns a 3100 g reference mean and a 1000 g group difference; it does not create the student solution objects.
- Without the CSV, sourcing stops with the intended Czech message naming the expected path and project. No automatic installation, package attachment, working-directory change, graphical-state change, or answer key is in the public script.
- An untracked reference harness solved all eight core and four optional tasks. It confirmed 344 rows, two missing body masses, 342 retained observations, group counts and means, the two-group model and equal-variance t-test identity, ordinary and Tukey intervals, ANOVA degrees of freedom and F, unchanged fitted values after reference change, within-species SDs, and the species-by-island and missing-sex counts.
- Individual-mass, residual-versus-fitted, and Q–Q plots were saved outside the repository and visually inspected. Czech labels and units rendered correctly; the residual plot has the expected three bands.
- A separate read-only reviewer applied the canonical exercise-reviewer prompt to the complete worksheet and blueprint and reported `No findings.` A focused re-review of the subsequent runnable worked example also reported `No findings.` The 68-minute core is an author estimate, not a timed beginner trial; U01 and U08 may take longer for slower groups.
- The stable exercise download URL is not live while `website-release.yml` has `exercises: []`. Human approval is complete; the separate release workflow remains necessary after the exercise pull request is merged. Project `renv::status()` reports recorded but currently unused packages after the placeholder was replaced; `emmeans` is available and the reference harness passed without changing the lockfile.
