# Stage 0 - Scope Lock

## Metadata

- Week: L06
- Date: 2026-08-06
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl (pending review)

## Git checkpoint

- Stage group: Stages 0-1 planning
- Branch: `lesson/l06-scope-data`
- Base branch and commit: `main` at `ef366a1` (`Initial commit`)
- `git status --short` reviewed: [x]
- Previous-stage PR merged: N/A
- Planned PR: Planning PR for Stages 0-1; not opened

## Topic sentence

Extend the familiar linear-model workflow by changing only the predictor type: begin with a numerical response observed in two groups, make the two fitted group means and the residual distances visible, and interpret the reference-group mean and between-group difference before naming the classical two-sample comparison. Then add further groups without changing the model formula, distinguish reference-level coefficient questions from the overall ANOVA question, and use post-hoc comparisons only as explicit follow-up questions. Keep the conclusion effect-first: estimated differences and their biological importance, uncertainty, compatibility with the tested hypotheses, and study limitations.

## Weekly outcomes (mapped)

- Canonical L06 outcome 1 from `_internal/osnova_lekci.md`: Fit `lm(y ~ skupina)` for two or more levels and interpret its coefficients.
- Canonical L06 outcome 2 from `_internal/osnova_lekci.md`: Explain the t-test and ANOVA as special cases of the linear model.
- Canonical L06 outcome 3 from `_internal/osnova_lekci.md`: Decide when post-hoc comparisons make sense and interpret their results.
- Model-first framing from `_internal/osnova_lekci.md`: Treat group comparisons as an extension of the linear model already used in L03-L05, not as a catalogue or decision tree of disconnected tests.

## Inspiration consulted

- Authoring problem to solve: How to make a categorical predictor feel like a natural extension of the familiar linear model, while helping beginners see what the intercept, group coefficient, fitted values, residuals, t-test, overall ANOVA question, and follow-up comparisons each mean.
- Primary source: [Experimentology, Section 7.1.1: Regression for estimating a simple treatment effect](https://experimentology.io/007-models.html#regression-for-estimating-a-simple-treatment-effect), especially [Figure 7.1](https://experimentology.io/007-models_files/figure-html/fig-models-ols-plot-1.png).
- Supporting sources: [ModernDive, one categorical explanatory variable](https://moderndive.com/5-regression.html); [Modern Statistics with R, regression models](https://www.modernstatisticswithr.com/regression.html); [CUNY Biostatistics, comparing means among groups](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Compare_means_among_populations.html).
- Pattern worth borrowing: Show individual observations in two groups, one horizontal fitted value per group, and the residual distance from every observation to its fitted group mean. Contrast the least-squares fit with deliberately worse candidate group means so students can explain visually why one model fits better. Only after that visual reasoning should the lesson connect the fitted values to the reference-group mean, the group difference, the `lm()` coefficients, and the t-test.
- Adaptation for this course: Recreate the figure with the selected biological or ecological dataset, Czech labels, the course semantic colours, and a progressive question -> candidate fit -> residual comparison -> best fit -> coefficient interpretation sequence. Extend the same visual language to three or more groups before introducing the omnibus ANOVA question. The Experimentology website states that the book is licensed CC BY-NC 4.0 and the chapter gives Figure 7.1 no separate third-party credit; direct reuse would still require attribution and a final item-level license check. An original course-native recreation will better support the chosen data story and visual system.
- Pattern explicitly rejected: A test-selection decision tree; an isolated sequence of `t.test()`, `aov()`, and post-hoc function calls; leading with dummy-variable algebra; importing the tea-tasting example as the main L06 data story before Phase 1; interpreting observational group differences causally; matrix derivations of OLS; multiple predictors or interactions.
- Why the selected pattern fits this course: It starts from observations, fitted values, and residuals that students already know, makes the new categorical-predictor geometry inspectable, and preserves one model formula as the number of groups increases. It also keeps effect magnitude and uncertainty ahead of p-values, continuing the evidence hierarchy established in L05.

## Concrete student actions (3-5)

1. Identify a numerical response and categorical predictor, inspect the observations and group summaries, and fit `lm(odezva ~ skupina)`.
2. Interpret the intercept as the expected response in the reference group and each group coefficient as an estimated difference from that reference group.
3. Use fitted group means and residuals to explain why the classical equal-variance two-sample t-test and one-way ANOVA are questions within the same linear-model framework.
4. Distinguish the overall question of whether the group means are all equal from a reference-level or pairwise comparison, and decide which follow-up comparisons answer the biological question.
5. Interpret group differences in an effect-first conclusion that reports magnitude, biological importance, uncertainty, adjusted evidence when several comparisons are examined, assumptions, and study limitations.

## Out of scope this week

- Multiple predictors, adjusted effects, and correlated predictors; these belong to L07.
- Interactions, factorial or two-way ANOVA, and ANCOVA; interactions belong to L08.
- Candidate-model comparison using R², adjusted R², or AIC; this belongs to L09.
- Transformations, nonlinear remedies, repeated measures, blocks, hierarchical data, and mixed models; these belong to later lessons.
- Detailed derivations of sums of squares, the F distribution, or Tukey's studentized-range distribution.
- A catalogue of nonparametric alternatives. The broader course-outcome file mentions them in an outdated weekly mapping, but the current canonical L06 scope in `_internal/osnova_lekci.md` does not.

## Formal depth boundary

### Core and student-visible

- A categorical predictor as a factor with two or more levels.
- The reference level as an explicit modelling choice rather than an invisible R default.
- Fitted values as group means and residuals as observation-to-group-mean distances.
- The intercept as the reference-group mean and a coefficient as a difference from that mean.
- The same `lm(odezva ~ skupina)` formula for two and several groups.
- The two-group coefficient question, the overall multi-group ANOVA question, and specific follow-up comparisons as different questions about one fitted model.
- Estimated differences, confidence intervals, adjusted p-values where applicable, diagnostics, and an effect-first biological interpretation.

### Intuitive only

- Least squares as choosing fitted group means that minimize the total squared residual distances.
- The two-group identity between the coefficient t statistic and the corresponding one-degree-of-freedom F statistic.
- The ANOVA F statistic as comparing systematic between-group variation with residual within-group variation.
- Why examining many pairwise questions increases the chance of at least one misleadingly extreme result and therefore requires a family-aware procedure.

### Deferred

- Matrix representation of indicator variables and closed-form OLS estimates.
- Detailed sums-of-squares decompositions and Type I, II, or III ANOVA tables.
- Formal derivation of the F distribution or Tukey's method.
- Planned contrast systems, orthogonal contrasts, effect coding, and alternative parameterizations beyond a brief note that the reference level can change.

## Risks and dependencies

- Risk: R's default `t.test()` uses Welch's unequal-variance test, whereas the ordinary `lm()` comparison assumes a common residual variance. The lesson must qualify the equivalence and must not claim that every t-test is numerically identical to this model.
- Risk: Reference coding can make the coefficient table appear to privilege one group or can tempt students to read the intercept p-value as evidence of group differences. The reference group must be chosen and displayed explicitly, and the coefficient table must remain attached to the group means and biological question.
- Risk: The omnibus ANOVA result, reference comparisons, and all-pairs post-hoc results answer different questions. The narrative must not collapse them into one generic significance decision.
- Risk: The Experimentology example is a randomized treatment study. L06 must use causal language only if the selected dataset and study design justify it.
- Dependency: Phase 1 must find a real, documented dataset with a numerical response and a categorical predictor with at least three interpretable levels. It should support a natural two-group entry, a meaningful extension to several groups, visible within-group variability, and diagnostics that do not require later-course remedies.
- Dependency: Dataset choice remains subject to the full Phase 1 broad-discovery and human-approval gates.

## Decision

- [ ] Scope locked for implementation
- [ ] Continue Stage 1 on this same planning branch
- Notes: Phase 0 is in review. Repository initialization and the teaching-arc proposal are complete; human approval is required before the scope is locked and Phase 1 begins.
