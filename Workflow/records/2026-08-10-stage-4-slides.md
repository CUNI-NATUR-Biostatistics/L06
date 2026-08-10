# Stages 4-5 - Slide Storyboard, Build, and Human Review

## Metadata

- Week: L06
- Date: 2026-08-10
- Author: Codex with Ondřej Mottl
- Reviewer: Ondřej Mottl (storyboard and visual direction approved 2026-08-10)

## Git checkpoint

- Stage group: Stages 4-5 presentation
- Branch: `lesson/l06-presentation`
- Base branch and commit: `main` at `7c394f1` (`Build L06 written materials around categorical linear models (#3)`)
- Stages 2-3 PR merged: [x] [#3](https://github.com/CUNI-NATUR-Biostatistics/L06/pull/3), merged 2026-08-10
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x]
- Presentation PR: Not opened

## Technical readiness

- Fresh R session activates `D:/GITHUB/CUNI-NATUR-Biostatistics/L06`: [x]
- `renv::status()` reports no issues: [x]
- Rscript, Quarto, and `decktape.cmd` are available: [x]
- Required render, modelling, and figure packages are installed in the project library: [x]
- Approved `Learning_materials/skripta.qmd` and its Stage 2-3 record were reviewed before storyboarding: [x]
- Existing template/gallery content in `Presentation/presentation.qmd` remains unchanged until storyboard approval: [x]

## Storyboard stop point

This record is the Stage 4 storyboard proposal. It compresses the approved 47-page written lesson into a classroom argument rather than mapping every written section to slides. Full slide text, slide-local R chunks, figures, rendered outputs, and the Stage 5 review work remain intentionally deferred until the human author approves this story map.

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: Modern Statistics with R for a connected model-based course architecture, the CUNY Biostatistics book for biological question framing, and ModernDive for frequent short understanding checks and the connection between regression and inference.
- Approved L06 source pattern: raw observations -> fitted group means -> residual geometry -> coefficient interpretation -> overall model question -> explicit follow-up questions.
- Presentation patterns retained from the canonical guidance: biological question before outcomes, one recurring anchor graph, data moment before statistical term, prompt -> evidence -> interpretation -> bridge blocks, immediate interpretation after evidence, and a visible return to the opening biological question near the middle of the lecture.
- Adaptation for this deck: compress the detailed written derivations, reuse the strongest approved visuals, and make the lecture revolve around one sentence: **the linear model stays the same; a categorical predictor changes how it chooses fitted values and which question we ask of those values.**
- Intentionally not reused: a test-selection tree, a catalogue of named procedures, the full written derivation of the t and F distributions, all optional R workflows, matrix notation, alternative contrast coding, multiple predictors, interactions, or causal language about species differences.

## Narrative thesis

Students should leave seeing one continuous model story rather than three disconnected procedures. With a numerical predictor, the model chooses a fitted value on a line. With a categorical predictor, it chooses a fitted group mean. A two-group coefficient asks about one mean difference; the same model with three groups supports an overall question about whether all means are equal; post-hoc contrasts then answer specific pairwise questions. At every step, the conclusion returns to effect size, uncertainty, within-group variability, and the limits of the observational penguin data.

## Opening and closing spine

- Student-facing title: **Když prediktor není číslo**
- Subtitle or spoken framing: **Od rozdílu průměrů k analýze rozptylu**
- Opening biological question: **Liší se průměrná hmotnost těla mezi druhy tučňáků?**
- Prior-lesson hook: L05 established that a statistical test is a question about a model parameter and that an effect, its uncertainty, and its p-value answer different parts of the scientific question.
- Mid-lecture spine return: **U dvou druhů už umíme odhadnout rozdíl a jeho nejistotu. Jak ale položíme jednu poctivou otázku všem třem druhům najednou?**
- Closing question and next-lesson bridge: **Změnily by se zdánlivé rozdíly mezi druhy, kdybychom v modelu zohlednili také pohlaví nebo ostrov?**

## Proposed slide spine

The target is approximately 40-42 slides for a 90-minute lecture, including 9-11 explicit interaction moments. Exact slide count remains flexible; the unit of approval is the sequence of teaching moves below, not a fixed number.

| Act | Approx. slides | Classroom move | Dominant reusable evidence | Interaction or checkpoint | Bridge |
|---|---:|---|---|---|---|
| 0. Question before method | 1-4 | Title -> penguin question/visual hook -> 3-5 learning outcomes -> short L05 callback | Credited three-species illustration and the familiar idea that a test asks about a model coefficient | Retrieval prompt: what did estimate, interval, t-statistic, and p-value each tell us in the previous lesson? | The old model used a numerical predictor; species is a name rather than a measurement. |
| 1. First see the individuals | 5-10 | Show pooled grey body masses, then reveal species for Adélie and Gentoo, then add means and SD | Approved pooled-data, species-split, two-mean, and fixed-gap/variable-spread figures | Prediction: state the null hypothesis and judge compatibility from the raw points; partner task on the same mean gap under low versus high within-group variability | A mean difference is only half the evidence; the model must keep the variability around group means visible. |
| 2. The same model needs a new switch | 11-15 | Briefly retrieve the fitted line, fitted value, and residuum; ask what must replace the numerical predictor; reveal the `je Gentoo?` 0/1 switch; translate data words into the two fitted means | Approved numerical-predictor callback, binary-predictor figure, and two-row membership table | Minimal prompt: **Jak může název druhu vstoupit do stejné rovnice?** | The 0/1 values are coding choices that let one formula select one of two group means. |
| 3. Read the two-group model in grams | 16-20 | Fit `lm(hmotnost_tela_g ~ druh)`; map intercept and coefficient back to the two mean lines; reconstruct the Gentoo mean; show fitted values and residua | Approved coefficient-in-data and fitted-value/residual figures; one compact visible `lm()`/`summary()` sequence | Misconception MCQ: which row tests the biological difference, and what does the intercept p-value actually test? | We can describe the difference, but the biological question also needs uncertainty and compatibility with zero. |
| 4. Reuse L04-L05 inference, do not reteach it | 21-24 | Put the Gentoo-minus-Adélie estimate and 95% interval on a zero-centred difference axis; connect estimate/SE to t and p; name the classical equal-variance two-sample t-test only after the model result | Approved coefficient interval and aligned model-output values | Prediction: does the interval include zero, and what biological statement follows? Partner explanation of why a small p-value is not the effect size | Under the same assumptions, the classical two-group t question is the coefficient question inside `lm()`; R's default Welch test is explicitly distinguished. |
| 5. Add a third species without changing the framework | 25-29 | Add Chinstrap to the same anchor graph and response scale; reveal that the R formula is unchanged while the model gains one group mean and one reference difference | Approved three-species means/SD figure, two-switch table, and reference-coefficient annotations | Prediction: what changes in the coefficient output and what stays fixed? Checkpoint: which species comparison is not directly printed with Adélie as reference? | Reference coefficients answer two specific questions, but the opening question asks whether all three means are equal. |
| 6. One overall question creates ANOVA | 30-35 | Return to the opening question; compare one common mean with three species means; reveal how group means shorten residuals and reduce SSE; only then name analysis of variance/ANOVA and interpret the F ratio | Approved one-mean-versus-three-means figure, SSE decomposition, and annotated `anova()` output | Prediction: which candidate model leaves shorter residuals? Misconception MCQ: what does a small overall p-value establish? | The overall result says at least one mean differs; it does not identify every differing pair. |
| 7. Follow the overall result with pairwise questions | 36-38 | Ask which differences matter; show that `emmeans` extracts means from the already fitted model; reveal the three Tukey-adjusted contrasts on a common zero-centred axis | Approved post-hoc interval figure, with the raw species means kept as a visual reference | Small-group interpretation: which pair remains compatible with zero, and why does that not contradict the overall ANOVA? | Gentoo differs clearly from both other species, while Adélie and Chinstrap are similar in this sample. |
| 8. Check, limit, and conclude | 39-42 | Show compact diagnostics; distinguish expected vertical residual bands from problems; reveal sex/island structure; state an effect-first biological conclusion; finish with takeaways and the next question | Approved residual-versus-fitted, Q-Q, sex-within-species, and species/island context displays | Closing conceptual question about adding sex or island as another predictor | The next lesson extends the same model with additional predictors rather than repairing ANOVA with another named test. |

## Storyboard by concept block

### Block 1 - The distance between means is only half the story

- Prompt: **Budou data slučitelná s nulovým rozdílem průměrné hmotnosti Adélie a Gentoo?**
- Evidence reveal: pooled grey body masses -> the same observations separated by species -> group means and SD -> the same mean gap under three levels of within-group variability.
- Interpretation: A mean gap is a biological effect measured in grams; its evidential strength depends on the variability that remains among individuals within groups.
- Bridge/caveat: Preview the phrase **analýza rozptylu** only as the need created by the evidence. Do not begin with ANOVA as a named method.

### Block 2 - A categorical predictor selects a fitted mean

- Prompt: **Jak může název druhu vstoupit do stejné rovnice, kterou už známe pro číselný prediktor?**
- Evidence reveal: familiar line and residuum -> visible 0/1 membership switch in the data -> two horizontal fitted means -> intercept and difference mapped directly onto the graph.
- Interpretation: The response still equals fitted value plus residuum. The predictor has changed how the fitted value is selected, not the model framework itself.
- Bridge/caveat: The switch is a coding convention, not a biological scale or ordering of species; changing the reference changes coefficient labels, not fitted means or residua. In an experiment with a control group, choosing the control as the reference makes every treatment coefficient answer the intended treatment-minus-control question directly.

### Block 3 - One coefficient, its uncertainty, and the two-group question

- Prompt: **Jak velký je rozdíl Gentoo minus Adélie, jak přesně jej známe a je slučitelný s nulou?**
- Evidence reveal: coefficient as a vertical gap in grams -> interval on a difference axis -> aligned estimate, SE, t-statistic, interval, and p-value.
- Interpretation: Lead with magnitude and biological meaning, then uncertainty, then compatibility with the null hypothesis. The classical equal-variance two-sample t-test is a historical name for this same two-group coefficient question under the same assumptions.
- Bridge/caveat: Do not repeat the full L05 t-distribution derivation and do not claim equivalence with R's default Welch test.

### Block 4 - Three groups create an overall question

- Prompt: **Jsou všechny tři průměrné hmotnosti slučitelné s jednou společnou hodnotou?**
- Evidence reveal: add Chinstrap without changing `lm(hmotnost_tela_g ~ druh)` -> compare one common mean with three group means -> reveal shorter residuals, SSE reduction, and the explained-versus-residual variability ratio.
- Interpretation: ANOVA is the overall question asked of the same fitted linear model. F compares variation associated with the different fitted means with variation that remains around those means.
- Bridge/caveat: A small overall p-value supports **at least one difference**, not the claim that every pair differs.

### Block 5 - Pairwise follow-ups and responsible conclusion

- Prompt: **Které konkrétní dvojice se liší a jaké rozdíly jsou stále slučitelné s nulou?**
- Evidence reveal: the three already fitted species means -> Tukey-adjusted pairwise intervals -> compact diagnostics and the sex/island context.
- Interpretation: Gentoo is heavier on average than both Adélie and Chinstrap in this sampled community; Adélie and Chinstrap have similar sample means and their adjusted interval includes zero.
- Bridge/caveat: These are observational species associations. Sex and island structure remain mixed with species and motivate the next lesson on additional predictors.

## Planned interaction cadence

1. Retrieval prompt after the L05 callback.
2. Prediction of the two-group null hypothesis from raw observations.
3. Partner comparison of the same mean gap under different within-group variability.
4. Minimal formula-design prompt before revealing the 0/1 switch.
5. MCQ on the intercept p-value versus the group-difference row.
6. Interpretation of the estimate and 95% interval before revealing the complete conclusion.
7. Prediction of what changes when Chinstrap is added.
8. Checkpoint on which pair is absent from the reference-coded coefficient table.
9. Prediction comparing one common mean with three species means.
10. MCQ on what the overall ANOVA p-value does and does not establish.
11. Small-group interpretation of the three post-hoc intervals.
12. Closing question about adding sex or island.

Every voting prompt will include a visible task-specific `Když nehlasujeme` fallback. Discussion slides will repeat the graph, values, or output needed to answer so students do not have to remember transient evidence.

## Approved variability exercise sequence

The relationship between the distance separating fitted group means and the variability remaining within groups will recur twice. Students first reason from unchanged-axis plots without seeing F-values; the same examples return during the ANOVA block, where F formalizes the comparison they already made visually.

All examples are explicitly labelled synthetic teaching scaffolds. They use equal group sizes (`n = 10` per group), the same plotting scale, and the same standardized observation pattern within each group so only the intended quantity changes.

### Exercise A - Same means, different within-group spread

- Hold fixed: both fitted group means.
- Change: within-group SD from narrow to wide.
- Prompt: **Vznikne rozdíl mezi skupinami jen proto, že se jednotlivci uvnitř skupin více liší?**
- Payoff: Changing within-group spread does not itself create a systematic difference between means. When the means are identical, the between-group signal remains zero.

### Exercise B - Same mean gap, different within-group spread

- Hold fixed: a mean difference of 1,000 g and `n = 10` per group.
- Change: within-group SD of 250, 500, and 1,000 g.
- First encounter: rank the three plots by how clearly group membership separates the observations.
- ANOVA return: reveal F-values of 80, 20, and 5 for the exact constructed examples.
- Payoff: The biological difference in grams is unchanged, but evidence weakens as more variability remains within groups.

### Exercise C - Same within-group spread, different mean gap

- Hold fixed: within-group SD of 500 g and `n = 10` per group.
- Change: mean differences of 250, 500, and 1,000 g.
- First encounter: predict which arrangement lets species explain the greatest share of visible variation.
- ANOVA return: reveal F-values of 1.25, 5, and 20 for the exact constructed examples.
- Payoff: With the remaining noise held fixed, greater separation between fitted means produces stronger evidence against a shared mean.

### Exercise D - Different biological effects, the same F ratio

- Compare mean-difference/SD combinations of 500/250, 1,000/500, and 1,500/750 g, again with `n = 10` per group.
- Prompt: **Který výsledek má nejsilnější statistický důkaz a který největší biologický rozdíl?**
- Reveal: all three exact constructed examples give `F = 20` and the same p-value, while their mean differences in grams are very different.
- Payoff: Relative statistical evidence can stay unchanged while the biological effect size changes. This reconnects ANOVA directly to the L05 distinction between effect magnitude and evidence about a null hypothesis.

For two groups, student-facing language will begin with **vzdálenost mezi odhadnutými průměry** and **variabilita uvnitř skupin**. The more formal phrase **variabilita mezi skupinami** arrives only after the visual meaning is established.

## Approved generated illustration set

The human author selected four course-native illustration concepts. They are pacing and memory devices, not analytical evidence. Statistical claims remain attached to real or explicitly synthetic plots.

### 1. Ice-floe laboratory

- Teaching role: make the two adjustable quantities memorable—distance between group centres and spread of individuals around each centre.
- Planned placement: open the recurring variability exercise sequence and return briefly before the F-statistic reveal.
- Composition: two penguin colonies on separate ice floes, with movable centre flags and visibly tighter or looser clusters; no generated labels or formulas.
- Overlay plan: Quarto adds Czech labels and arrows for **vzdálenost průměrů** and **variabilita uvnitř skupin** so text remains exact and editable.

### 2. One feeding flag versus three

- Teaching role: introduce the comparison between one common fitted mean and one fitted mean per species before naming ANOVA.
- Planned placement: transition into Act 6 immediately before the real one-mean-versus-three-means residual figure.
- Composition: the same penguins first orient toward one shared feeding flag and then toward three species-specific flags; positions and framing remain fixed between the two states.
- Caveat: the illustration represents assignment to fitted values, not the arithmetic of squared residuals. The following analytical plot carries that evidence.

### 3. Penguin model passport

- Teaching role: make reference coding feel like a chosen model language rather than a biological ranking, then transfer that reasoning to studies with a genuine control group.
- Planned placement: after the 0/1 switch is visible in the real data and before reading the coefficient table.
- Composition: Adélie first receives the reference passport/stamp, while Gentoo and later Chinstrap receive difference-from-reference entries; a short second state replaces the species labels with **kontrola**, **ošetření A**, and **ošetření B**. Generated artwork contains no legible text.
- Overlay plan: Quarto supplies the precise `0`, `1`, reference, and difference labels and makes it possible to swap the reference without changing the underlying illustration.
- Control-group payoff: when **kontrola** is the reference, the intercept is the fitted control mean and the treatment coefficients are **ošetření A minus kontrola** and **ošetření B minus kontrola**. The coefficient table still does not directly contain **ošetření B minus ošetření A**.
- Design caveat: choosing a group as the reference does not make it a control and does not create causal interpretation; the study design defines the control and the strength of causal claims.

## Approved control-group reference emphasis

The presentation will treat reference choice as a scientific interpretation decision, not merely an R default. This is especially important when a study contains a control group.

### Classroom sequence

1. Establish reference coding with the real penguin data, where the choice is mainly a convenient coordinate system.
2. Use the penguin model passport to show that changing the reference changes the intercept, coefficient directions, and printed row labels while leaving fitted values, residua, overall fit, and the omnibus F-test unchanged.
3. Transfer immediately to a generic experiment with **kontrola**, **ošetření A**, and **ošetření B**.
4. State the practical rule: if the biological questions are treatment-versus-control comparisons, set the control group explicitly as the reference before fitting the model rather than trusting alphabetical factor order.
5. Check understanding with an MCQ asking which differences appear directly in the coefficient table and which treatment-to-treatment difference does not.

### Student-facing takeaway

**Referenční skupina určuje, vůči čemu čteme intercept a rozdílové koeficienty. Ve studii s kontrolou proto obvykle nastavíme kontrolní skupinu jako referenci záměrně.**

### Scope protection

- Do not imply that reference choice changes fitted means, residua, predictions, model fit, the overall ANOVA result, or the underlying biological data.
- Do not imply that reference coding creates a valid control group or causal evidence; those come from study design.
- Do not expand this transfer example into planned contrasts, Dunnett procedures, alternative contrast matrices, or a catalogue of multiple-comparison methods in L06.

## Written-material follow-up required

The approved `Learning_materials/skripta.qmd` already explains that R uses the first factor level as the reference, shows `relevel()`, demonstrates coefficient sign changes, and states that fitted group means and residua remain unchanged. What is missing is the high-stakes application to studies with a control group; the existing reference-change example is also in an optional collapsed block.

The proposed written-material addition is deliberately small:

1. Add a non-collapsed teaching box immediately after the main explanation of how R chooses the reference level and before the first categorical `lm()` fit.
2. Use the generic groups **kontrola**, **ošetření A**, and **ošetření B** to show that a control reference makes the two printed treatment coefficients direct treatment-minus-control comparisons.
3. Show the explicit base-R pattern `relevel(x = data_studie$skupina, ref = "kontrola")` and check `levels()` before fitting.
4. State what changes and what stays fixed when the reference changes.
5. Add the design caveat that reference coding does not itself establish which group is a control or justify causal language.

Because the Stages 2-3 written-materials pull request is already merged and the current branch is dedicated to Stages 4-5, this source change must not be added to `lesson/l06-presentation`. It requires a separately authorized, correctly based follow-up branch and pull request; after that follow-up merges, the presentation branch should incorporate the updated `main` before full deck publication.

### 4. Penguin group photograph with a magnifying glass

- Teaching role: distinguish the one overall question about the complete group from later questions about individual pairs.
- Planned placement: bridge from the overall ANOVA result to post-hoc comparisons.
- Composition: one three-species group portrait followed by a magnifying glass isolating each of the three possible pairs.
- Payoff: students see **celek nejdříve, dvojice potom** before encountering the adjusted pairwise intervals.

### Shared art direction and safeguards

- Use one coherent flat editorial or paper-cut visual language across all four assets.
- Do not imitate Allison Horst or another identifiable living artist; the existing credited Palmer penguin artwork remains a separate source.
- Generate no text, formulas, graph axes, package output, or logos inside the bitmap. Add all instructional language in Quarto.
- Keep artwork colours neutral or natural enough that the course semantic purple and orange remain available for model and interpretation overlays.
- Provide concise Czech alt text and retain generation prompts/provenance in the Stage 4 working record or asset notes.
- Limit generated illustrations to these four recurring moments. Do not use them as decorative filler between ordinary content slides.

## Visual workflow and rhythm

- Use one recurring anchor graph of individual body masses by species. Add only one new layer when it returns: species grouping, group means, residuals, reference differences, the third species, or context by sex.
- Preserve the approved species colours for identifying groups, while keeping the epistemic role of observed points, model summaries, and interpretation legible through neutral context, line type, direct labels, and restrained semantic accents.
- Keep the response scale in grams and stable when moving from two to three species. Keep all difference/interval displays on a common zero-centred axis when feasible.
- Use the strongest written-material visuals as designs to simplify and recreate in slide-local hidden chunks. Do not copy the learning-material figures mechanically when their captions, aspect ratios, or density are unsuitable for a lecture canvas.
- Use a visual cadence of prompt -> plain/full-width evidence -> mixed evidence-plus-interpretation -> caveat or bridge. In any five-slide run, no more than three slides will use named boxes, panels, strips, or blockquotes as the dominant element.
- Keep figure generation local to each concept block and display saved assets through `include_local_figure()`.
- The eventual setup chunk will load dependencies only; it will not install packages during rendering.

## Scope compression decisions

### Retain in the deck

- Raw observations before means or tests.
- Difference relative to within-group variability.
- A short but explicit bridge from numerical to categorical `lm()`.
- Reference-level meaning of intercept and group coefficient.
- Explicit transfer from an arbitrary species reference to purposeful control-group reference coding.
- Fitted group means and residua.
- Effect, interval, and p-value for the two-group coefficient.
- Same formula with three species.
- One common mean versus three group means as the visual origin of ANOVA.
- Overall test before adjusted pairwise follow-ups.
- Compact diagnostics, observational limitations, and the bridge to additional predictors.

### Compress or omit from slides

- The optional data-download and preparation workflow.
- Repeated printed summaries and long console outputs.
- The full derivation of the two-group confidence interval and t distribution already taught in L04-L05.
- The detailed arithmetic derivation of sums of squares, mean squares, and the F distribution; slides retain the visual ratio and the annotated `anova()` table.
- The optional reference-level change with `relevel()` as a full code sequence; retain only the conceptual checkpoint if pacing allows.
- Full `emmeans` output-column explanations; retain one transparent code-to-interval bridge.
- Detailed diagnostic prose; retain the expected three-band pattern, the Q-Q reading, and the limitation that matters for the biological conclusion.

## Learning-outcome coverage

| L06 learning outcome | Storyboard coverage |
|---|---|
| Fit `lm(y ~ skupina)` for two or more levels and interpret coefficients | Acts 2-5 keep the formula visible, map the intercept to the reference mean, map coefficients to reference differences, and show the unchanged formula after adding Chinstrap. |
| Explain the t-test and ANOVA as special cases of the linear model | Act 4 names the equal-variance two-group t question after interpreting the coefficient; Act 6 derives the overall ANOVA question from competing fitted values and residual variation in the same `lm()` framework. |
| Decide when post-hoc comparisons make sense and interpret their results | Act 7 begins only after the overall question, uses adjusted simultaneous intervals, and asks students to distinguish the supported Gentoo contrasts from the Adélie-Chinstrap result. |

## Risks and planned fixes

- Visual rhythm risk: repeated species dot plots could become monotonous. Planned fix: treat one plot as an anchor, alternate full-width evidence with minimal questions, difference-axis intervals, code/output, model-comparison panels, and one closing context display.
- Content pacing risk: the full written derivation would overload a 90-minute lecture. Planned fix: retain only one transparent derivation per conceptual jump and reuse L04-L05 inference rather than reteaching it.
- Concept risk: students may hear t-test, ANOVA, and post-hoc as three unrelated procedures. Planned fix: keep one model object and one formula visible across all three questions and explicitly state what changes: the hypothesis asked of the fitted means.
- Reference risk: students may accept R's first factor level without checking whether it matches the scientific comparison. Planned fix: use the model-passport transfer example to make control-as-reference an explicit modelling decision and verify the factor levels before fitting.
- Interpretation risk: the species effect may sound causal. Planned fix: use sampled-community and association language, and return to sex/island structure before the final conclusion.
- Scope risk: the sex/island reveal could drift into multiple regression. Planned fix: pose it only as the unanswered next-lesson question and do not fit an adjusted model.

## Stage 5 - Human review gate

- Lesson-vision review completed: [ ]
- Human review completed: [ ]
- Credible findings resolved: [ ]
- Presentation rendered and checked: [ ]
- Reviewer decision: Pending full deck

## Decision

- [x] Technical setup for Stages 4-5 complete
- [x] Storyboard ready for human review
- [x] Storyboard approved by human author
- [ ] Full `Presentation/presentation.qmd` drafting authorized
- [ ] Slides ready for review
- [ ] Diff contains only Stages 4-5 sources, records, and corresponding outputs
- [ ] Presentation PR ready to merge
- Notes: The human author approved the storyboard, the recurring variability exercises, and the four generated-illustration concepts on 2026-08-10. Full slide drafting and asset generation remain separate next actions.
