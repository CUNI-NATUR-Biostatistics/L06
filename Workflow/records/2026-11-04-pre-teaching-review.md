# L06 pre-teaching review (2026-11-04)

## Scope and decisions

- Trigger: Ondřej Mottl asked for a review of all L06 parts (learning materials, presentation, R script, Moodle questions) against the current instructions before teaching.
- Review: independent read-only subagent reviews of the complete artifacts with the canonical prompts: `vision-corrector.md` for the skripta and for the deck, `exercise-reviewer.md` for the exercise, `question-reviewer.md` for the Moodle bank (all 104 questions solved blind, all keys matched), each with Sonnet at medium effort because they are complete-artifact reviews; `glossary-coverage-reviewer.md` with Haiku at low effort because it is a bounded check.
- Decisions by Ondřej Mottl (2026-11-04):
  - D1: add the residual histogram and Cook's distance to the skripta and exercise, and add a histogram panel and one Cook's distance sentence to the deck.
  - D2: move the hand-computed RSS from U08 to N13.
  - D3: keep `qt()` in the skripta with a callback to L05; Moodle states a rounded critical value instead of printing `qt()`.
  - D4: add the text-only equation stages to the sum-of-squares and mean-square blocks.
  - Scope: apply all findings on branch `fix/l06-coefficient-notation-reference` ("Use the same branch for everything"). No staging, commits, pushes or pull requests were authorised or made.

## Starting knowledge and prior-practice check

Derived from `_internal/moodle/knowledge/L00`–`L05.yaml`, with L03–L05 lessons checked where doubtful.

- Notation: intercept and slope are $a$ and $b$ through L05; the population slope is written in words. $\beta$ numbering starts in L06.
- Models: `lm()` with one numeric predictor, `coef()`, `summary()`, `confint()`, `fitted()`, `resid()`.
- Uncertainty and tests: standard error, 95% CI, t-statistic, `Pr(>|t|)`, critical values read from a table; `qt()` and `pt()` are extension only.
- Standing practices: residuals against fitted values, residual histogram, Q–Q plot, Cook's distance with 4/n and leave-one-out comparison, effect size with interval before the p-value, association not causation.

`Rscript R/check_prior_practices.R L06`:

- Before the changes (2026-11-04): 7 `missing` rows, 44 `applied`.
- After the changes (2026-11-04): 1 `missing` row, 50 `applied`.

| Practice | File | Disposition |
|---|---|---|
| `check_influential_observations` | skripta | applied: new subsection „Nestojí výsledek na několika tučňácích?“ |
| `check_influential_observations` | exercise | applied: `L06-U07` step 3 |
| `check_influential_observations` | deck | applied: Cook's distance sentence on „Sedí model k datům?“ |
| `plot_residual_histogram` | skripta | applied: histogram in „Popisuje model data rozumně?“ |
| `plot_residual_histogram` | exercise | applied: `L06-U07` step 2 |
| `plot_residual_histogram` | deck | applied: panel B on „Sedí model k datům?“ |
| `report_effect_in_original_units` | deck | false positive: the deck reports differences in grams |

## Changes

### Learning materials

- Notation sentence states that $a$ and $b$ were used through the testing lesson and that $\beta$ starts here; $\hat\beta_j$ tied once to their R rows; back-reference to the penguin colours corrected to the lesson on relationships of two variables.
- Diagnostics: residual histogram, base-R `hist()` code, Cook's distance subsection with visible code and computed values; independence judged for these data; the unsupported single-point claim moved to the new evidence; a sentence explains why the three-species plots also cover the two-species residuals.
- Equations: separate text-only, numeric and symbolic displays for the sum-of-squares decomposition and mean squares.
- `qt()` callback to the L05 table; `dolni_mez`/`horni_mez` renamed to `dolni_hranice`/`horni_hranice`; named arguments in visible calls; `indikátorová proměnná` named; `summary()` bottom lines set aside; teaching input `x_slope_change` named once; inference objects moved next to first use; unused objects removed; seven glossary wrappers added.
- Layout: six manual page breaks removed (50 PDF pages, previously 51).

### Presentation

- Notation slide retitled and rebuilt; speaker note corrected.
- Derivation: the sum-of-squares slide ties the total and within-group sums to RSS and answers the earlier prediction; the between-group slide says it equals the RSS reduction.
- Interaction: partner prompts on the residual slide and on the sum-of-squares slide.
- Diagnostics slide: three panels and the Cook's distance sentence, all values computed.
- Colour and classes: residual segments graphite on the sum-of-squares figure; non-question panels use `.panel-note`.
- Wording: bare „reference“, „ocasech“, „Předpověď“, „zatím“, axis label; misleading heading on control studies replaced; bare „významný“ replaced.
- Other: the post-hoc result slide reads its key rows; the F-test vote key moved to A; `qt()` replaces 1.96 in the sex-means intervals; the opening question returns verbatim in a box on „Jedna otázka zůstala otevřená“; long takeaway on „Druh není celý příběh“ split; computed alt text for the mass range.
- Not changed: slides were not merged, so complete teaching sections stay; code font size stays because no general brand class exists and lesson-specific CSS is not allowed.

### Exercise

See the 2026-11-04 revision in [2026-10-09-exercise-polish-blueprint.md](2026-10-09-exercise-polish-blueprint.md).

### Moodle (`_internal`, separate repository, uncommitted on `main`)

- `ci-rozdilu` restated with rounded output and a stated critical value; `table()` removed from `anova-pocty`, `anova-odvozeni` and `dve-skupiny`; `qq-graf` uses „chvosty“ and carries `L03.qq-graf-cteni`; `vyber-dvojice-v1` threshold and feedback corrected; `zaver-skupiny` options rebuilt; wording-decided statements rewritten; terminology corrected; `anova-zaver` uses an option pool; knowledge file TODOs and N13 sources updated.

### Generated and synced files

- The render route synced `theme/` and `R/Functions/` from `_brand`, including the `.quiz-question > h2` sizing already seen in L05. `Learning_materials/skripta.{html,pdf}`, `Presentation/presentation.{html,pdf}`, `docs/index.html` and five figures in `Presentation/Materials/` are render outputs.

## Validation

- Environment: after a Windows reinstall, R 4.5.1 was installed next to 4.6.2 because the locked Rcpp does not compile on R 4.6; renders used the existing `renv/library/windows/R-4.5` library. Node.js, DeckTape, chrome-headless-shell and GitHub CLI were installed.
- Skripta: project render passes (50 pages). Deck: project render passes in PollsLive offline mode (73 slides); `Presentation/presentation.html` and `docs/index.html` are byte-identical.
- Exercise: parses, sources from a clean session in a temporary folder; no line above 80 characters apart from URLs; changed expected values reproduced in a scratch harness.
- Moodle: `build_moodle_xml.R L06` writes 104 questions; `check_knowledge_file.R L06` fails only on the `built_from` stamp.
- `node pollslive/validate.mjs` passes; `pollslive/quiz.json` unchanged.
- Independent verification of the corrections by the same reviewers: see below.
- The other changed skripta layout: the Cook's distance chunk is kept on one page with the same `{=typst}` block as L05.

## Independent verification

The same reviewers re-checked the corrections on 2026-11-04; the small items they raised were then applied and the final render rerun.

- Skripta: all substantive findings resolved; no statistical defect introduced. The diagnostics-order finding is accepted as partly resolved: the checks stay after the two-group test, and the text states why they also cover the two-species residuals. Applied afterwards: sequencing word removed, chunk options added, Cook's chunk kept on one page. Not changed: hex colours in the visible Cook's chunk, the same as the approved L05 chunk.
- Presentation: verdict "ready to teach"; high and medium findings resolved. Applied afterwards: slide 69 clearance and visible intervals, length of vote option A on slide 25. Partly resolved: interaction cadence (two prompts added, no slides merged); vote keys now B, B, C, A; sparse slides 33 and 65 remain.
- Exercise: all findings resolved and every changed expected result reproduced. Applied afterwards: histogram description in U07, save instruction for files shown as text. Core timing remains an open owner decision: the reviewer estimates 105–118 minutes against the 85–95 minute budget.
- Glossary: all seven wrappers present; all slugs exist; no new first-occurrence gaps.
- Moodle: 38 of 38 questions in changed families solved blind, all keys matched, no wrong arithmetic. M1–M5 resolved; M6 partly resolved (`dve-skupiny` and `reference-zmena` statement 4 still have forms with fixed truth, left for Moodle item statistics under the guide's one-fix-round budget). Families with wording edits only were checked by comparing answer lines and terms, not re-solved. New minor point: `anova-odvozeni` statement 4 is a general statement that does not always describe the printed F.

The coordinator checked the top findings against source and inspected all final rendered pages at contact-sheet size, with slides 43, 48 and 69 and skripta pages 34–37 at higher resolution.

## Story-map amendment (requires explicit human approval)

Changed student-facing headings against the 2026-10-09 amendment:

| Internal role | Previous heading | New heading |
|---|---|---|
| Notation bridge (deck) | Jak jsme minule zapisovali numerický prediktor? | Z $a$ a $b$ se stávají $\hat{\beta}_0$ a $\hat{\beta}_1$ |
| Reference vote (deck) | Reference není „nejdůležitější“ skupina | Referenční skupina není „nejdůležitější“ skupina |
| Control studies (deck) | U kontrolních studií je reference zásadní | V pokusu s kontrolou je přirozenou referenční skupinou kontrola |
| Reference caveat (deck) | Ale reference nevytváří kontrolu | Referenční skupina nevytváří kontrolu |
| Influence check (skripta, new) | — | Nestojí výsledek na několika tučňácích? |

Knowledge-state ledger changes: $\beta$ is introduced in L06, not a callback; the previous ledger line „β notation is a callback (introduced in the uncertainty and testing lessons)“ is superseded. Histogram and Cook's distance may be assumed from L03–L05 and are applied here as a reminder.

Human story-map approval of this amendment: **approved** by Ondřej Mottl on 2026-11-05 („I approve“), with no requested revisions. The reply answered a request for approval of both the learning-material and the presentation amendment and did not exclude either, so it is recorded as covering both and their knowledge-state ledger changes. It was given after the artifacts were drafted, as in the 2026-10-09 polish; it does not replace human review of the finished artifacts.

## Human review of the skripta and second amendment (2026-11-05)

Ondřej Mottl reviewed the skripta and asked for these changes.

Applied directly:

- Data section: the penguins are named as known from earlier lessons; the factor sentence no longer suggests an ordinal variable.
- „Kde je sklon?“ ends with the slope value, computed from the 10 mm change.
- „Dvouskupinový model v R“: the table and text point at the black and purple arrows and the orange and teal mean lines.
- New terms bolded at first introduction. Made a course rule in `_internal/.ai/authoring/quarto.md` at his decision.
- „Simultánní interval“ stays: it is the glossary term and a core Moodle term, and no rule forbids it. At his request it gets a visible introduction.

Story-map amendment, learning materials only:

| Internal role | Heading | Change |
|---|---|---|
| Notation bridge | Stejná věc, různé názvy | New subsection before „Kde je intercept?“; shows the line with $a$ and $b$, then with $\hat{\beta}$ |
| Fair-comparison idea | Co porovnává F-statistika | Shortened to the idea and the known sums of squares |
| Degrees of freedom | Stupně volnosti: z kolika kousků informace součet vznikl? | New; per-species table, between, within and total, and the split that mirrors the sums of squares; question with folded answer |
| Mean squares | Průměrné čtverce: variabilita na jeden stupeň volnosti | New heading, existing content, now after degrees of freedom |
| F ratio | F-statistika je poměr průměrných čtverců | New heading, existing content, then `anova()` |
| Reading `anova()` | Jak číst tabulku `anova()` řádek po řádku | `Df` item shortened to a pointer |
| Estimated means | Within „Tři skupiny potřebují dva přepínače“ | `emmeans()` moved here from post-hoc, install note and output reading included |
| Simultaneous intervals | Simultánní intervaly: 95 % pro celou sadu najednou | New visible subsection with a computed table; replaces the folded box on wider Tukey intervals |
| Pairwise differences in R | Párové rozdíly v R | New heading; why `emmeans`, then `contrast()` |

Knowledge-state ledger changes: degrees of freedom as used-up information and $n-2$ may be assumed from L05; the lesson introduces between-group, within-group and per-species degrees of freedom and their split; `emmeans()` is introduced for estimated means before post-hoc comparisons.

Human story-map approval: the notation, F-statistic and `emmeans()` changes were **approved** by Ondřej Mottl on 2026-11-05 („I approve“), for the learning materials only. The simultaneous-interval subsection followed his request in the same message („there needs to be somewhere more intro to this term“), and the „Párové rozdíly v R“ heading was added while implementing; both are in the finished skripta he approved on 2026-11-05 („I approve the skripta“). The deck is not changed; he reviews it separately.

Validation (2026-11-05): project render passes (53 PDF pages); `check_prior_practices.R L06` still has only the deck false positive; `check_knowledge_file.R L06` checks all 57 sources and fails only on the `built_from` stamp; `build_moodle_xml.R L06` builds. Independent review of the complete skripta (`vision-corrector.md`, Sonnet, because it needs statistical and pedagogical judgement) found no high-severity issue, and the glossary pass (`glossary-coverage-reviewer.md`, Haiku at low effort, a bounded check) found missed first occurrences. Applied: planned-contrast box moved after the pairwise results; $\hat{\beta}_1$ arrow named before its first figure; `summary()` F tied to `anova()`; between-group df reasoning reworded; hidden objects moved next to their plots; repeated line equations removed; bold corrected; a summary bullet on F and mean squares; glossary wrappers. Not applied: rewriting the Stage 2 record, because this amendment is recorded here, as in the 2026-10-09 polish. The fixes were not re-reviewed by the reviewers.

Further notes from Ondřej Mottl, applied the same day: boxplots added to the first two body-mass figures with the deck's settings; the notation $F(2, 339)$ explained; the overall result placed in a box; `prumery_druhu` recreated in the „Párové rozdíly v R“ code as a reminder. No heading changed. An optional folded box in „Jak se z F-statistiky stane p-hodnota“ shows three F-distributions with three illustrative F values each, all computed and marked as not being model results. Also fixed: the violin fill in the two species figures used the default ggplot colours instead of the species colours.

## Deck restructure from human review (2026-11-05)

Ondřej Mottl asked to open the deck with two species, as the skripta does, to split the notation slide, and to rebuild the block that went into equations too quickly, starting from the means in a figure. He chose option B and the line through the two means from the proposed options („1 B, 2 yes“, 2026-11-05). This is recorded as story-map approval of the block for the presentation only, as stated in the proposal.

Story-map amendment, presentation (76 physical slides, previously 73):

| Order | Internal role | Student-facing heading | Change |
|---|---|---|---|
| 9, 10, 12 | Pooled data, colour reveal, mean and SD | Jak těžcí jsou tučňáci? · Barva odkryje skupiny · Průměr neříká celý příběh | Adélie and Gentoo only; Chinstrap joins at „Tři druhy, tři průměry“ |
| 17 | Data moment | Kolik čísel popíše dva průměry? | New; means in a figure, in grams, with a prompt |
| 18 | Concept in words | Stačí průměr Adélie a rozdíl | New; the same figure with two arrows, no symbols |
| 19 | Switch | Jak dostaneme druh do rovnice? | Pair task reworded; table and figure with the 0 and 1 axis |
| 20 | Notation | Stejná věc, různé názvy | Split from the former notation slide; only $a$, $b$ to $\hat{\beta}$ |
| 21 | Two values of $x$ | Když je $x$ jen 0, nebo 1 | Split from the former notation slide; adds the line through the two means |
| 22 | Grams | Nula nechá průměr Adélie, jednička přičte rozdíl | Shortened; the arrows stay visible |
| 27 | Reading coefficients | Dva koeficienty | Same figure and arrows replace the table |

Removed heading: „Z $a$ a $b$ se stávají $\hat{\beta}_0$ a $\hat{\beta}_1$“.

Knowledge-state ledger changes: the means and their difference are seen in grams before any symbol; $\hat{\beta}$ arrives after the switch; „referenční skupina“ is named after the equation; Chinstrap data are not assumed before the three-group block.

`Presentation/Materials/body_mass_by_species.png` stays as the recorded reference in `GENERATED_IMAGES.md`; the slide now uses `body_mass_two_species.png`.

Validation (2026-11-05): offline project render passes (76 slides); `Presentation/presentation.html` and `docs/index.html` are identical; `check_prior_practices.R L06` still has only the deck false positive, run before the last small fixes; `node pollslive/validate.mjs` passes. Slides 10, 12, 17–22, 26 and 27 were inspected in the PDF; fragment states in the HTML were not. Independent review of the deck (`vision-corrector.md`, Sonnet, because the sequence needs pedagogical judgement) found no teaching defect of high severity. Applied: object moved to its first-use slide; pair task tied to the base and difference, with „přepínač“ named on the slide; ordered-growth wording on the line slide replaced; plotmath labels for $\hat{\beta}$; a visible prompt on the `lm()` slide; a term before its definition removed; Chinstrap removed from a code comment; a speaker note on the two-species start. Not applied, as the current wording is correct and already approved: „jen 0, nebo 1“, „Do minulé lekce“, the heading „Kolik čísel popíše dva průměry?“. The fixes were not re-reviewed.

### Second round of deck notes (2026-11-05)

Requested by Ondřej Mottl and applied; deck still 76 slides:

- „Stejná věc, různé názvy“ moved directly after the „Lineární model“ divider, at his request, although this opens the block with notation.
- New slide „Nestojí výsledek na několika tučňácích?“ replaces the Cook's distance sentence on „Sedí model k datům?“; „Materiály“ removed, as other lessons have no such slide. Credits remain on the slides that carry the images.
- „Jedna otázka zůstala otevřená“ rebuilt around a figure of the two known differences, with one open question; the prediction moved to „Jeden nebo tři?“.
- „Co můžeme říci biologicky?“ now states what the data say about the null hypothesis; species colours on „Každý druh zapne jinou kombinaci“; „variabilita (rozdíl)“; the sum-of-squares task asks for the procedure in words; step-by-step fragments for mean squares; „Jak to souvisí s výsledkem celkového F-testu?“; the skripta's sex figure on „Druh není celý příběh“. `species_and_sex_means.png` was replaced by `species_by_sex_points.png`.

- New slide „Průměry druhů bez ručního sčítání“ after „Jedna rovnice popíše všechny tři druhy“: `emmeans()` for the means only, as in the skripta. „Post-hoc v R“ recreates the object as a reminder and adds `contrast()`. Added after Ondřej Mottl asked whether it would be included, following the recommendation given to him; 77 slides.

These changes were requested by name, so no separate story-map proposal was made. Ondřej Mottl approved the finished presentation on 2026-11-05 („I approve the presentation“), with the live PollsLive variant still to be rendered. The independent review of this round was run after that approval (`vision-corrector.md`, Sonnet): no high finding, and the p-value sentence, the Cook's sentence, the `emmeans()` slide and the fragment indexes were found correct. Decided by him on 2026-11-05 („1. B, 2 yes“): the species-coloured spans on „Každý druh zapne jinou kombinaci“ stay as a recorded exception to the rule against inline `style=` in `presentation.md`, because `_brand` has no species text classes and the styling is limited to this one slide; `_brand` classes were offered and not chosen. Applied with his approval, after the deck approval: the prompt without „potom“ on „Co můžeme říci biologicky?“; the words before `MS` on „Dělením stupni volnosti získáme průměrné čtverce“; `method` explained on „Post-hoc v R“; a stale speaker note about colours on „Nula nechá průměr Adélie, jednička přičte rozdíl“.

## Open items

- Ondřej Mottl approved the exercise on 2026-11-06 („I approve the r script“), after the 2026-11-06 revision; its timing was accepted on 2026-11-05. He approved the Moodle question changes on 2026-11-05 („I approve the Moodle questions change“), after seeing the 38 substantively changed questions as built. The skripta and the presentation were approved by Ondřej Mottl on 2026-11-05; the independent reviewers did not re-check the fixes and notes applied after their review, including the F-distribution box.
- Deck: Ondřej Mottl reviews it separately. The `quarto.md` rule on bold terms was not applied to other lessons.
- Commit, push and the synchronized PollsLive render: the deck is currently the offline variant, so it has no live QR. A synchronized render needs a pushed branch. The cached client at `pollslive/.client-cache/` fails Git's ownership check since the Windows reinstall (new user SID), so it needs a `safe.directory` entry or a fresh download; the offline render used `BIOSTAT_POLLSLIVE_CLIENT_SOURCE` pointed at that cache after comparing `local.mjs` with the pinned revision.
- New release before teaching: the latest release `L06-v0.5.0-20261015` predates all of this and the 2026-10-19 and 2026-10-21 changes.
- Moodle: stamp `built_from` after the lesson is committed; import needs a test import and Moodle preview; ablation was not rerun.
- `_brand`: a general class for larger code output on slides would resolve the remaining small code slides.
- Not verified: fragment states in HTML, live PollsLive, RStudio GUI steps with beginners.
