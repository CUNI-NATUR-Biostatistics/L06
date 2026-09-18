# Presentation standards rollout

## Scope

- Date: 2026-09-16
- Branch: `lesson/l06-presentation-standards`
- Requirements: Issues #5, #6, and #8; Issue #7 is tracked in `2026-09-16-pollslive-retrieval-quiz.md`

## Decisions

- The first slide uses the approved question-first course title composition and canonical logo.
- The four approved generated penguin illustrations retain their roles and previously recorded provenance. Each display chunk now includes meaningful Czech alternative text and the visible caption `Ilustrační obraz vytvořen AI.`
- The visible base-R coefficient calls remain where they teach reference coding.
- Hidden `broom::tidy()` objects supply displayed two-group and three-group coefficient values and the two projected `tinytable::tt()` tables. The two-group object also supplies its interval and t statistic.
- Render-time assertions compare tidy estimates with the corresponding `coef()` results.

## Retained illustration checksums

- `ice_floe_laboratory.png`: `FEE7789A78FA4EF7C5EF8C4CCEF91F96BE25BF07C219B1A9A98B19595EC00FEB`
- `one_vs_three_feeding_flags.png`: `B4AC06A44A0BE717B3F2A3AC59C37A1DDFE4E39661BADCB6F503C5AF91C3E0EA`
- `penguin_model_passport.png`: `AA81B5D80B9CF7F08C3129A1CCC54F09462137BB00AEF62E3ED5B2057A26151E`
- `penguin_group_magnifying_glass.png`: `2CB3F562D47E710BD43A539883F591EE5A33DB3C8EF95F21A74AC607F0D4EEF1`
- Original generation details and the rejected magnifying-glass draft remain documented in `Workflow/records/2026-08-10-stage-4-slides.md`.

## Validation status

- Render-time assertions confirm both tidy coefficient vectors equal the corresponding base R coefficient vectors.
- Canonical render: passed; HTML and PDF contain 69 slides, and `Presentation/presentation.html` matches `docs/index.html` by SHA-256.
- Visual inspection: passed, including the title at 1600 × 900 and 1280 × 720, the two-group test table, the three-group coefficient table, and all four retained illustration captions.
- UTF-8, duplicate chunk-label, R parsing, focused diff, and `renv::status()` checks: passed.
- Independent read-only presentation review: passed after the hidden-code namespace correction; no remaining finding.
- The approved three-question PollsLive retrieval block is implemented and validated offline; see `2026-09-16-pollslive-retrieval-quiz.md` for evidence, independent review, and remote activation gates.
- Git publication: follow-up authorization granted on 2026-09-16; review and merge state is tracked in the lesson PR.
