# Stage Log

Use this file as the running history for lesson-production decisions and stage transitions.

## Entry format

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| YYYY-MM-DD | Stage X | started/in review/done | One sentence summary | `Workflow/records/...` | `branch-name` / #PR | Name |

## Current lesson log

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| 2026-08-06 | Stage 0 | done | Locked a model-first two-group-to-ANOVA arc built around fitted group means, residual geometry, reference differences, and explicit follow-up questions | `Workflow/records/2026-08-06-stage-0-scope.md` | `lesson/l06-scope-data` / [#1](https://github.com/CUNI-NATUR-Biostatistics/L06/pull/1), merged | Ondřej Mottl approved |
| 2026-08-06 | Stage 1 | done | Selected Palmer penguin body mass by species after a ten-example broad scan and numerical comparison with two experimental finalists | `Workflow/records/2026-08-06-stage-1-dataset.md` | `lesson/l06-dataset` / [#2](https://github.com/CUNI-NATUR-Biostatistics/L06/pull/2), merged | Ondřej Mottl approved |
| 2026-08-06 | Stage 2 | done | Completed a callback-rich Palmer penguin lesson linking categorical `lm()`, within-group variability, two-group inference, overall analysis of variance, and pairwise follow-ups | `Workflow/records/2026-08-06-stage-2-learning-materials.md` | `lesson/l06-skripta` / not opened | Ondřej Mottl approved the development draft |
| 2026-08-06 | Stage 3 | in review | Revised the written materials after ten feedback batches, now including one reproducible obtain-process-save data workflow, consistently boxed figure labels, an explicit regression-to-group bridge, L02 bill illustration, fitted numerical-model coefficients, reference-level recoding, manual CI construction, explicit separation of observed t, its two-sided mirrored boundary, and the critical alpha limits, historical test framing, a fully traced F-to-p-value explanation, correctly centred group-mean segments, and an overall-test-before-Tukey-post-hoc sequence with visible fitted species means implemented directly from the fitted `lm` with namespaced `emmeans` calls | `Workflow/records/2026-08-06-stage-2-learning-materials.md` | `lesson/l06-skripta` / not opened | Independent closure reviews complete; awaiting Ondřej Mottl |
