# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L06
- Date: 2026-08-06
- Author: Codex with Ondřej Mottl
- Reviewer: Independent internal vision and glossary reviews complete; human review by Ondřej Mottl pending

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l06-skripta`
- Base branch and commit: `main` at `cad1903` (`Merge pull request #2 from CUNI-NATUR-Biostatistics/lesson/l06-dataset`)
- Stages 0-1 PR merged: [x] [#2](https://github.com/CUNI-NATUR-Biostatistics/L06/pull/2), merged 2026-08-06
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x]
- Written-materials PR: Not opened

## Current stop point

The complete Stage 2 development pass is ready for human review. The draft implements the approved story map, has passed independent lesson-vision and glossary reviews, and renders successfully to HTML and a 25-page PDF. Stage 3 remains open until the human author reviews the teaching choices and requests or approves revisions.

## Author direction incorporated

- Return explicitly to the general regression formula used for a numerical predictor and change that formula carefully for a categorical predictor.
- Build visible callbacks to the previous course sequence: summaries and means, graphs and variability, the linear-model formula, fitted values and residuals, uncertainty and confidence intervals, and significance tests.
- Let students see where every important number comes from in the data. Major results should be traceable to raw observations, a plotted group mean, a vertical difference, a residual segment, an interval endpoint, or a clearly labelled output cell.
- Before changing the formula, make the variability around each group mean visible and show why the distance between means must be judged relative to within-group variability; use this comparison to motivate the name analysis of variance.

## Technical setup

- `renv` activates L06 in a fresh R session and `renv::status()` reports no issues: [x]
- Locked `palmerpenguins` version 0.1.1 is available: [x]
- Reproducible preparation script added at `R/prepare_penguin_data.R`: [x]
- Prepared teaching table added at `data/palmer_penguins.csv`: [x]
- Data provenance and recreation instructions added at `data/README.md`: [x]
- The prepared table retains all 344 observations and both missing body-mass values so their removal can be shown rather than hidden: [x]
- Complete `Learning_materials/skripta.qmd` development pass added: [x]
- Rendered `Learning_materials/skripta.html` and `Learning_materials/skripta.pdf` regenerated: [x]

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: Modern Statistics with R, the CUNY Biostatistics book, and genomicsclass/PH525x.
- Structural pattern retained from Stage 0: raw observations -> candidate fitted values -> residual distances -> best fit -> coefficient interpretation -> inferential question.
- Adaptation for this lesson: begin from the exact L03 formula and notation, replace the numerical predictor value with a transparent group-membership switch, and keep the same observed value = fitted value + residuum decomposition throughout.
- Intentionally not reused: a catalogue of separate tests, a test-selection tree, formula-first dummy-variable algebra, matrix notation, multiple predictors, interactions, or a causal interpretation of observational species differences.

## Narrative thesis

The linear model has not disappeared and analysis of variance, later connected to the abbreviation ANOVA, is not a new species of analysis. The response is still split into a fitted part and a residuum. What changes is how the predictor enters the fitted part: a numerical predictor moves the fitted value along a line, whereas a categorical predictor selects one of several fitted group means. The coefficient still describes a biologically interpretable difference, its uncertainty, and a testable question. The strength of the group comparison depends not only on the distance between fitted means but also on the variability of observations around those means.

## Working student-facing title and opening question

- Working title: **Když prediktor není číslo: od rozdílu průměrů k analýze rozptylu**
- Opening biological question: **Liší se průměrná hmotnost těla mezi druhy tučňáků?**
- Opening L05 callback and prediction: **Jakou nulovou hypotézu o průměrné hmotnosti druhů můžeme otestovat? Podle prvního grafu předpovězte, zda s ní budou data slučitelná.**

## Callback map

| Prior lesson idea | What students should retrieve | How L06 changes or reuses it | Planned visible evidence |
|---|---|---|---|
| L01: numerical and categorical variables, mean, SD | A mean summarizes a numerical variable; a category divides observations into groups; SD describes variability around a mean | Calculate one body-mass mean and one within-species variability summary for each species | A small raw-data table connected to group summaries, horizontal mean marks, and visible observation-to-mean distances |
| L02: graph first, visible pattern is not yet an inferential conclusion | Raw observations and variability must be inspected before a model or test | Compare the distance between means with the spread and overlap within groups rather than showing only bars or isolated means | Jittered observations on a common scale, with group means and within-group spread added only after students inspect the points |
| L03: `lm(y ~ x)`, fitted value, residuum, SSE | `y_i = \hat{y}_i + e_i = a + b x_i + e_i`; the model chooses fitted values that minimize squared residuals | Replace the numerical value `x_i` with a visible group-membership switch and show that fitted values become group means | Side-by-side numerical-predictor and categorical-predictor diagrams using the same labels, colours, and formula parts |
| L04: estimate, standard error, confidence interval | An estimated coefficient is uncertain and an interval shows compatible effect sizes | Put an interval around the estimated difference in mean body mass | Difference arrow in grams followed by a horizontal confidence-interval display on the same scale |
| L05: effect first, null hypothesis, t statistic, p-value, careful conclusion | A test asks about a parameter; p-value is not effect size or probability that the hypothesis is true | Test a zero group difference, then distinguish a two-group coefficient question from an overall multi-group question | One aligned table showing estimate, SE, t, CI, and p-value, with each value linked back to the plotted difference |

## Variability bridge before the formula change

This short sub-block belongs immediately after the two-species raw-data and summary display and before the categorical-predictor formula. It should establish why a difference between two means is not interpreted in isolation.

1. Show the actual Adélie and Gentoo observations with both fitted means and report `n`, mean, and SD beside each group.
2. Mark the distance between the two means as one visible quantity and several observation-to-mean distances within each species as a second kind of quantity.
3. Ask: **Would the same difference between means be equally persuasive if the observations within both species were much more variable?**
4. Show a clearly labelled conceptual comparison with the same two means but low versus high within-group variability. Keep the real penguin display beside it so the teaching scaffold is not mistaken for additional observed data.
5. State the payoff in ordinary language: evidence for a group difference depends on how large the difference between fitted means is relative to the variability that remains within groups.
6. Preview the method name without yet deriving its statistic: analysis of variance compares variation associated with the fitted group means with residual variation around those means. Use the preferred Czech term **analýza rozptylu**; introduce **ANOVA** only afterward as its conventional abbreviation.

## Formula bridge: the central explanatory sequence

The formula bridge should occupy a full early concept block rather than appearing as a brief algebraic note after the tests.

1. **Retrieve the L03 decomposition.** Show one familiar flower row and the formula already learned: `naměřená hodnota = odhadnutá hodnota + residuum`, followed by `y_i = \hat{y}_i + e_i = a + b x_i + e_i`.
2. **Name what the numerical predictor did.** Its value `x_i` located an observation horizontally and `a + b x_i` selected one point on the fitted line.
3. **Create a two-species membership table before changing the formula.** Each selected penguin has a species, measured body mass, and a new visible switch `je Gentoo?` taking the value 0 for Adélie and 1 for Gentoo.
4. **Write the relationship in data words before symbols.** `odhadnutá hmotnost těla = průměr druhu Adélie + rozdíl Gentoo vůči Adélie × přepínač je Gentoo`.
5. **Substitute one real Adélie row and one real Gentoo row.** For Adélie the switch is 0, so the fitted value is `a`; for Gentoo it is 1, so the fitted value is `a + b`.
6. **Only then show the adapted general formula.** `\hat{y}_i = a + b z_i`, where `z_i` is the displayed 0/1 group-membership switch; retain `e_i = y_i - \hat{y}_i` unchanged.
7. **Add a third species by adding one switch, not by replacing the model framework.** `\hat{y}_i = a + b_1 z_{\text{Chinstrap},i} + b_2 z_{\text{Gentoo},i}` with Adélie as the explicit reference.
8. **Return immediately to meaning.** `a` is the Adélie fitted mean, `b_1` is Chinstrap minus Adélie, and `b_2` is Gentoo minus Adélie; no matrix derivation or alternative contrast coding is introduced.

## Proposed story map

| Block | Driving question | Callback and new move | Planned visual or table | Number-to-data trace | Misconception checkpoint or payoff |
|---|---|---|---|---|---|
| 1. Familiar model, unfamiliar predictor | What must change when the predictor is a species name rather than a measurement? | Retrieve the L03 general formula and identify the role of `x_i` before showing penguin data | One regression line with a highlighted observation, its fitted value, and residuum; the corresponding formula components sit beside the graph | Every symbol points to a point coordinate, a line height, or a residual segment | The linear model is a framework, not a synonym for drawing a sloped line |
| 2. Meet the observations | What exactly was measured, on whom, and what is missing? | Retrieve variable types and observational units from L01 | Six-row teaching table, island/species context diagram, and a count of complete and missing body masses | Highlight two blank body-mass cells before the complete-case step; connect column names to axes | A row is one measured adult penguin, not a species mean; the sample does not represent every penguin everywhere |
| 3. From observations to group means | What do individual body masses and species means each tell us? | Retrieve mean, SD, and within-group variability | Raw body-mass dot plot for Adélie and Gentoo; reveal horizontal means and group summaries after the noticing prompt | Selected raw values feed a small mean calculation; the resulting number becomes the plotted horizontal line | Different means do not imply that every individual in one group is heavier than every individual in the other |
| 3a. The distance between means is only half the story | Why can the same difference between means provide stronger or weaker evidence? | Compare between-group separation with variability around each group mean before introducing the categorical formula | Actual penguin summaries plus a clearly labelled same-means, low-versus-high within-group variability thought experiment | The mean gap, SD values, and selected observation-to-mean distances use distinct annotations but remain on the body-mass scale | Analysis of variance gets its name from comparing explained group structure with residual variation; it does not mean that group means are ignored |
| 4. Change the predictor inside the formula | How can a species name enter the same regression formula? | Replace numerical `x_i` with the 0/1 `je Gentoo?` switch only after the visual group means are understood | Two-row formula table: Adélie switch 0 and Gentoo switch 1, with the fitted calculation shown beside each row | The 0 and 1 appear in the data table before they appear in the equation; `a` and `a + b` point to the two mean lines | The 0/1 values are coding choices, not biological measurements or ranks of species |
| 5. Read the two-group model | What do the intercept and group coefficient mean in grams? | Fit `lm(hmotnost_tela_g ~ druh)` with Adélie explicitly set as the reference | Coefficient output annotated with arrows to the Adélie mean and the Gentoo-minus-Adélie vertical gap | Reconstruct the Gentoo mean as intercept plus coefficient and verify it against `mean()` | The intercept p-value does not test whether the species differ; it tests whether the reference mean equals zero grams |
| 6. Fitted values and residual geometry | What does the model predict for every penguin, and what remains unexplained? | Retrieve fitted values, residua, and SSE from L03 | Raw points, two fitted mean lines, residual segments for a small subset, then the full residual pattern | A trace table contains measured mass, fitted group mean, and their difference for the same observations | Residua remain even when the model is useful; all individuals in a group share the same fitted value but not the same measured value |
| 7. Difference, uncertainty, and the two-group test | How large and precise is the fitted species difference, and how compatible is it with zero? | Retrieve effect-first reporting, SE, CI, t statistic, and p-value from L04-L05 | Difference arrow in grams, then its CI; an aligned output table; optional same-axis null marker at zero | Estimate equals the vertical gap; t is the gap measured in SE units; CI endpoints and p-value are read from the same fitted coefficient | The equal-variance two-sample t-test and the coefficient test ask the same two-group question under the same assumptions; R's default Welch t-test is not claimed to be numerically identical |
| 8. Add Chinstrap without changing `lm()` | Does adding a third group require a new kind of model? | Keep the same response and formula, expand the categorical predictor to three levels | Animate or sequence the same plot from two to three species; show the formula gaining one membership switch and the coefficient output gaining one row | Each new coefficient is drawn as a vertical difference from the same Adélie reference mean | A coefficient table with one reference does not directly contain every pairwise comparison |
| 9. The overall ANOVA question | Are all three fitted means compatible with one common mean? | Contrast the overall question with the two reference-level coefficient questions | Side-by-side candidate models: one grand-mean line for all observations versus one fitted mean per species, both with residual segments or squared residual areas | Show how moving from one line to three lines reduces residual variation; map the ANOVA table to this comparison | A small overall p-value does not say that every pair of species differs, and ANOVA is not detached from `lm()` |
| 10. Follow-up comparisons | After the overall question, which biologically meaningful differences remain? | Introduce post-hoc comparisons as planned follow-up questions and family-aware inference | Forest plot of all three pairwise differences with simultaneous intervals, ordered to match the species plot | Every point estimate equals a visible difference between two mean lines; zero is a common reference | Chinstrap and Adélie can have a difference compatible with zero even when the overall ANOVA strongly rejects equal means |
| 11. Model checks and study limits | Does the simple group model describe these observations reasonably, and what can it not establish? | Retrieve residual diagnostics and association-versus-causation language | Compact residual-versus-fitted and Q-Q displays; species-by-island and species-by-sex context tables or diagrams | Diagnostic points retain species colours; limitation tables use the same counts as the prepared data | Species, island, and sex structure limit interpretation; the fitted differences are observational associations, not isolated causal species effects |
| 12. Effect-first biological conclusion | What can we responsibly say about body-mass differences in the sampled penguin community? | Reuse the L05 conclusion ladder | A final evidence table: estimated differences in grams -> intervals -> overall and adjusted evidence -> assumptions and limits | Every sentence points back to one row or figure already interpreted | Lead with magnitude and biological meaning; do not reduce the conclusion to significant/non-significant labels |
| 13. Bridge to the next lesson | Would the apparent species differences change if we accounted for sex or island? | Motivate L07 without fitting the multiple-predictor model | One split or layered view that reveals sex/island structure without adding a second predictor to the L06 model | Reuse observed group counts only; no adjusted coefficient is computed yet | The next step is not a post-hoc repair but a new biological question requiring more predictors |

## Planned visual system

- Use one stable species-colour mapping across raw data, fitted means, residuals, coefficient annotations, confidence intervals, and post-hoc comparisons.
- Keep the response axis in grams and, where possible, reuse the same limits when moving from two to three species so visual differences are not created by rescaling.
- Use colour only as a secondary cue: label species and reference relationships directly, and distinguish points, mean lines, residual segments, and intervals by shape or line type as well.
- Start unfamiliar displays from a familiar view. The post-hoc interval plot must be introduced as the already visible differences between group means placed on a common difference axis.
- Do not use bars for means as the main display because they hide individual observations and within-species variability.
- If penguin artwork is later used, verify the item-level reuse terms and credit it as requested; artwork is optional and must not replace analytical evidence.

## Number-tracing contract for the full draft

1. Introduce every worked number in a small data table before using it in an equation.
2. Use the same selected observations in the table, formula substitution, and residual diagram.
3. Draw the reference mean and every model coefficient as visible vertical quantities on the data scale before showing compact output.
4. Derive all data-dependent values with inline R in the eventual `skripta.qmd`; do not hardcode numerical results in prose or equations.
5. Keep the two-group and three-group examples based on the same prepared dataset and factor ordering so only the intended conceptual change varies.
6. When comparing displays, state what changes, what stays fixed, and whether variation comes from individuals, sampling uncertainty, or the question being asked.

## Learning-outcome coverage

| Canonical L06 outcome | Story-map coverage |
|---|---|
| Fit `lm(y ~ skupina)` for two or more levels and interpret coefficients | Blocks 4-8 move from a two-level membership switch to a three-level factor and keep the reference-level meanings visible |
| Explain the t-test and ANOVA as special cases of the linear model | Blocks 7 and 9 attach the two-group coefficient test and the overall group-means comparison to the same fitted model and residual geometry |
| Decide when post-hoc comparisons make sense and interpret their results | Block 10 makes pairwise comparisons explicit follow-up questions after the overall question and interprets simultaneous intervals in grams |

## Scope protections

- Do not teach a menu of `t.test()`, `aov()`, and post-hoc functions as separate procedures.
- Do not lead with dummy-variable algebra; the 0/1 switch appears only after raw observations, means, and the familiar regression formula are re-established.
- Do not expand into matrices, Type I/II/III sums of squares, alternative contrast coding, multiple predictors, interactions, transformations, mixed models, or nonparametric alternatives.
- Do not claim that the ordinary `lm()` coefficient test is identical to R's default Welch t-test.
- Do not imply that an overall ANOVA result proves every species pair differs.
- Do not interpret species differences causally or ignore the island and sex structure.

## Stage 2A checklist

- Coherent section order proposed: [x]
- Main data story fixed: [x]
- First visual/table specified: [x]
- First interpretation prompt specified: [x]
- Misconception checkpoints specified: [x]
- Bridge to the next concept and next lesson specified: [x]
- Human approval of story map: [x]
- Structural `skripta.qmd` draft begun: [x]

## Stage 2B complete; Stage 3 human review pending

- Major concept blocks implemented with visual anchors: [x]
- Interpretation prompts and explanatory payoffs implemented: [x]
- Glossary markup checked: [x]
- HTML and PDF rendered and visually checked: [x]
- Complete `skripta.qmd` reviewed by a separate read-only vision reviewer subagent: [x]
- Glossary-coverage review completed: [x]
- Credible internal-review findings resolved: [x]
- Human review completed: [ ]

## Development-pass validation

- `knitr::purl()` extraction and R parsing completed successfully: [x]
- Project render wrapper completed for HTML and Typst PDF: [x]
- All 25 PDF pages inspected for clipping, overlap, leaked warnings, and readability: [x]
- Rendered text checked for deprecated-plot warnings, source-helper leakage, and stale terminology: [x]
- Independent lesson-vision closure review: no findings [x]
- Independent glossary-coverage closure review: no findings [x]

## Decision requested from the human author

Review the complete written materials, especially the amount of detail in the 0/1 membership-switch explanation, the concrete-to-general F-statistic passage, and the balance between the overall analysis-of-variance question and Tukey follow-up comparisons. Stage 3 should record requested revisions or explicit approval before any presentation work begins.
