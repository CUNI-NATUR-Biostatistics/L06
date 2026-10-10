# L06 review polish (2026-10-09)

## Scope and approval

- Trigger: Ondřej Mottl asked for a full review of `Learning_materials/skripta.qmd`, `Presentation/presentation.qmd` and `Exercises/cviceni.R` against the canonical guidance and the L01–L05 style (focus on L02 and L05).
- Decisions by Ondřej Mottl on 2026-10-09:
  - notation: use β̂ with a callback to the a/b notation of the linear-model lesson;
  - recap model: replace bill length → bill depth (pooled slope −0.085 mm/mm, within-species slopes +0.18 to +0.22: Simpson's paradox) with flipper length → body mass;
  - post-hoc wording: soften (the F-test and pairwise comparisons answer different questions; Tukey does not need a prior significant F);
  - exercise: fully restyle to the L04/L05 format;
  - scope: approved the complete list of review findings;
  - Git: "make a single new branch and do all edits on it" → branch `polish/l06-review-fixes` from `main` at `ebf6da3`. No staging, commits, pushes or pull requests were authorized or performed.

## Changes

### Shared across artifacts

- Notation: β̂₀, β̂₁ (and β̂₂, x_{Chinstrap,i}, x_{Gentoo,i}) in both artifacts, with the a/b callback; hypotheses stated also as β₁ = 0.
- Terminology: residuum/residua, odhadnuté hodnoty (not fitované/predikce), numerická proměnná, dvouvýběrový t-test, chyba I./II. typu unchanged.
- Colour roles: data grey, model purple (coefficients, fitted values, estimates), orange for residual/interval/current focus; species keep the documented palmerpenguins palette (L02 exception); abstract groups A/B and sex use the `_brand` categorical palette.
- Thought experiment (same mean difference, different SD): identical generator in both artifacts.
- Czech decimal commas: new helpers `R/Functions/format_cz.R`, `format_cz_math.R`, `format_p_cz.R`; the skripta uses the L04/L05 `OutDec` hook for hidden figures.
- Diagnostics now precede the overall test in both artifacts.
- Post-hoc wording softened everywhere (skripta box „Dvě různé otázky položené stejnému modelu“, slide „Kdy dávají párová porovnání smysl?“, summaries, exercise).

### Learning materials

- Opening `Úvod` (question box, bridge to the previous lesson) and `Výsledky učení` (five items shared with the slides); ending `Co tedy můžeme říct o tučňácích?` (folded, effect-first example conclusion with limitations), `Co bude následovat dál`, `Shrnutí` (with the course-links table), `Závěrečná otázka` with a folded answer.
- Visible data route now runs on its own: `read.csv()` with relative path → `str()`, `summary()`, `colSums(is.na())` → drop missing mass → factor with fixed levels; the hidden fix-up chunk was removed; `pf()` reads F and df from a visible `anova()` table.
- Recap rebuilt on flipper length → body mass (intercept as extrapolation to a negative mass, 10 mm slope, one residual, word → numbers → symbols); `culmen_depth.png` deleted as unused.
- Folded answers for the question boxes; „přepínač“ defined at first use; the `relevel()` rule box moved after the reference explanation; equation progression completed for the CI and the SS decomposition; hardcoded caption values (t = 23,61) and df counts computed.
- Workflow narration (Nejdříve…, Až teď…, Teprve…) and process headings replaced with content headings; Czech fixes; alt text on every figure; glossary first occurrences added; TODO comments for missing slugs (alternativni-hypoteza, t-statistika, referencni-skupina, prumerny-ctverec, simultanni-interval).

### Presentation

- Outcomes shared with the skripta; „Dnes“, „Podíváme se na data“, concept-first and process headings replaced; straight quotes, typos („nulovým nulovým“, „dva rozdíly .“) and the misaligned equation fixed; the duplicate equation slide merged.
- H1 dividers added: `Jedna otázka pro tři druhy`, `Které dvojice se liší?`, `Závěr` (6 in total).
- Interaction cadence: new partner prompts on „Co můžeme říci biologicky?“ and „Tři rozdíly na jedné ose“; prediction moved from the illustration slide to „Jedna otázka zůstala otevřená“ so the picture no longer reveals the answer.
- Diagnostics slide moved before the ANOVA block, with Czech labels, raw residuals and an interpretation strip; visible `lm()` for three species on its first-use slide; visible two-species filter.
- Computed values instead of literals: SS worked example, df, `F = 20`, `1,3 kg`, p-values, island facts.
- Closing in the L05 pattern: bridge slide, `Shrnutí`, open closing question matching the skripta.
- Speaker notes on every content slide (previously none); alt text on every figure; AI disclosure „Ilustrace vytvořená pomocí AI.“; `Presentation/Materials/GENERATED_IMAGES.md` created for the four existing illustrations (tool and prompts unknown, hashes recorded) and the title-image brief.
- Rendering fixes: t-plot labels off the curve, CI plots with readable intervals, diagnostics axis, SS figures enlarged, sex plot axis.

### Exercise

See [2026-10-09-exercise-polish-blueprint.md](2026-10-09-exercise-polish-blueprint.md).

## Validation

- `R/render_skripta.R`: HTML and Typst PDF (50 pages) render without errors, warnings or TeX-conversion problems. Changed pages (data check, recap, equations, diagnostics, ANOVA, ending) inspected in the PDF.
- `R/render_presentation.R` with `POLLSLIVE_RENDER_MODE=offline` and `BIOSTAT_POLLSLIVE_CLIENT_SOURCE` pointing at the local `_internal` checkout (development override, not a synchronized render): 73 slides; `Presentation/presentation.html` and `docs/index.html` are byte-identical. All 73 PDF pages inspected on contact sheets; fixed slides re-inspected at full size.
- The renders refreshed the lesson theme cache from the local `_brand`/`slovnik` checkouts (`theme/*`, `R/Functions/Theme_generation/*`, `render_glossary_term.R`, `render_presentation_outputs.R`, `Learning_materials/course-logo-vertical.svg`); these are generated updates, not lesson edits.
- Visible skripta route reproduced from a clean session (read.csv → filter → factor). Unique chunk labels; no raw HTML; sequencing words only in speaker notes; all glossary slugs valid; `node pollslive/validate.mjs` passes.
- Exercise validation: see the blueprint.
- Not done: synchronized PollsLive render (requires pushed inputs), interactive HTML fragment walk-through, beginner pacing trial.

## Independent reviews (2026-10-09)

Three separate read-only reviewer subagents (capable general-purpose model, default effort, chosen per `behaviour.md` for complete-artifact reviews) inspected the complete artifacts after the first polish render.

- Learning materials (`vision-corrector.md` + glossary pass). Resolved: stale „délka zobáku“ sentence; non-reproducible `pf()` chunk; hardcoded df and group counts; missing `emmeans` setup and student install note; equation stages for the recap, CI and SS decomposition; the post-hoc sentence that still sounded like gatekeeping; colour roles of coefficients (purple everywhere) and of the highlighted residual on orange Adélie points (now graphite); „přepínač“ defined; `relevel()` box moved; pointer to diagnostics after the two-group test; Czech fixes; missing glossary wrappers. Kept: „mezikvartilové rozpětí (IQR)“, as in L01 (`terminology.md` lists „interkvartilový rozsah“ only as an abbreviation note — a course-wide decision for the owner); direct `format(..., decimal.mark = ",")` in three figure labels (already Czech).
- Presentation (`vision-corrector.md`, full-canvas PDF pass). Resolved: overlapping t-plot labels; unreadable CI plots (slides 30, 66); cadence gap in the post-hoc block; clipped diagnostics axis; small SS figures and odd ticks; missing ratio on the F slide; df reason; late visible three-species `lm()`; answer-revealing illustration placement; unsupported island claim; card and panel colour roles; positional `summary()`; furniture fatigue on two slides. Not changed: the stray colon in the offline PollsLive answer panel (generated quiz template, `_internal`); remaining sparse slides judged acceptable as deliberate pauses.
- Exercise: see the blueprint.

## Story-map amendment (requires explicit human approval)

The approved Stage 2 and Stage 4 story maps (2026-08-06, 2026-08-10) no longer match the artifacts. Changed and new rows, against the previous structure:

### Learning materials

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Biological question and bridge | Úvod | Question box; bridge from slope to group difference |
| 2 | Outcomes | Výsledky učení | Shared with slides |
| 3 | Data check | Data: jeden řádek je jeden změřený tučňák | Visible read → inspect → filter → factor |
| 4 | Two-group data moment | Hmotnosti tučňáků kroužkových a oslích | H0 prediction with folded answer |
| 5 | Variability contrast | Stejný rozdíl, jiná variabilita | Shared generator with slides; folded answer |
| 6 | Recap of numeric model | Připomenutí: přímka pro délku ploutve a hmotnost | Flipper → mass; β̂ callback to a/b |
| 7–8 | Switch coding and two-group model | Lineární model s kategoriální proměnnou · Dvouskupinový model v R | „přepínač“ defined; relevel box after reference |
| 9–10 | Fitted values, uncertainty, test, t-test name | (unchanged headings) | Pointer to diagnostics |
| 11 | Three species | Tři druhy, stejná formule | |
| 12 | Diagnostics before testing | Popisuje model data rozumně? | Moved before ANOVA |
| 13 | ANOVA | Jedna celková otázka: analýza rozptylu | |
| 14 | Post-hoc | Post-hoc: které dvojice se liší? | Softened rule box |
| 15–18 | Limits, conclusion, bridge, recap | Co jednoduchý model neoddělil · Co tedy můžeme říct o tučňácích? · Co bude následovat dál · Shrnutí · Závěrečná otázka | Effect-first folded conclusion |

### Presentation (73 physical slides; previously 64 approved, 69 rendered on 2026-10-08)

| Order | Internal role | Student-facing heading |
|---|---|---|
| 8–9 | Bridge, first data moment | Stejná logika, jiný typ prediktoru · Jak těžcí jsou tučňáci? |
| 13 | Section divider | Rozdíl mezi dvěma skupinami |
| 16–20 | Notation bridge and switch | Jak jsme minule zapisovali numerický prediktor? · Jak dostaneme druh do rovnice? · Nula nechá průměr Adélie, jednička přičte rozdíl · Jedna rovnice popíše oba druhy |
| 23 | Visible two-group fit | Stejná funkce `lm()`, nový prediktor |
| 28–29 | Fitted values and residuals | Každý tučňák dostane průměr svého druhu · Residuum je stále vzdálenost od odhadu |
| 31, 33–34 | Test and interpretation | Je rozdíl slučitelný s nulou? · Rozdíl, nejistota a test v jedné tabulce · Co můžeme říci biologicky? (partner prompt) |
| 43 | Diagnostics before testing | Sedí model k datům? |
| 44 | Section divider | Jedna otázka pro tři druhy |
| 45 | Spine return + prediction | Jedna otázka zůstala otevřená |
| 47 | Ratio named in words | Rozdíly průměrů proti variabilitě uvnitř skupin |
| 55 | Visible overall test | Celková otázka v R |
| 60 | Section divider | Které dvojice se liší? |
| 61 | Turning point illustration | Od celkové otázky ke dvojicím |
| 63 | Rule: when pairwise comparisons make sense | Kdy dávají párová porovnání smysl? |
| 66 | Pairwise interpretation (partner prompt) | Tři rozdíly na jedné ose |
| 68 | Section divider | Závěr |
| 70–72 | Bridge, recap, closing question | Co kdybychom přidali pohlaví nebo ostrov? · Shrnutí · Co potřebujete vědět, než napíšete „druh určuje hmotnost tučňáka“? |

Knowledge-state ledger changes: β notation is a callback (introduced in the uncertainty and testing lessons); „přepínač“ and „referenční skupina“ are defined before use; diagnostics precede any reliance on the F-test; the island facts on the sex slide are stated with their evidence; no slide uses a term before its data moment.

Human story-map approval of this amendment: **approved** by Ondřej Mottl on 2026-10-09 („I approve the story map“), with no requested revisions. The approval covers both the learning-material and the presentation amendment and their knowledge-state ledger changes. It was given after the artifacts were drafted, as in the L05 polish (2026-10-09); it does not replace human review of the finished artifacts.

## Decisions after the polish (2026-10-09)

- Story-map amendment: approved (see above).
- Title image and illustration refresh: Ondřej Mottl re-created the in-deck figures and the title image („Title image is done“); recorded in `Presentation/Materials/GENERATED_IMAGES.md`. The title-image release blocker is resolved.
- Interquartile range: Ondřej Mottl chose „mezikvartilové rozpětí“ („mezikvartilové sounds better“). Recorded as a course-wide term in `_internal/.ai/authoring/terminology.md`; the `slovnik` entry `iqr` now reads „IQR (mezikvartilové rozpětí)“ with the older forms as synonyms, and the glossary outputs were regenerated (slug unchanged). L01 and L06 already use this term; no lesson text changed.

## Human approval of the artifacts

Ondřej Mottl approved the polished learning materials, presentation and R exercise on 2026-10-10 („I approve learning materials, presentation and R script“). The approval does not authorize staging, commits, pushes, pull requests, synchronized PollsLive rendering or a release.

## Remaining gates and open items

- Synchronized PollsLive render after the branch is pushed (requires separate authorization).
- Beginner pacing trial of the exercise (author 91 min vs reviewer 105–115 min).
- Missing glossary slugs in `slovnik` (TODO comments in the skripta).
- `_internal` and `slovnik` terminology edits are local only (no commits).
