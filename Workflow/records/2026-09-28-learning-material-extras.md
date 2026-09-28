# L06 learning-material Extras revision

## Approval and scope

- Date: 2026-09-28
- Branch: `lesson/l06-learning-material-extras`
- Human approver: Ondřej Mottl
- Decision: approved in the course-wide L01-L08 Extra-content review and explicitly authorised for implementation on 2026-09-28.
- Scope: deepen the two assumptions and multiplicity issues already present in the categorical-predictor lesson.

## Mandatory story map

- Artifact: Learning materials amendment
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-28
- Approval decision and requested revisions: The course-wide L01-L08 Extra-content map was approved and implementation was explicitly authorised; no revisions were requested. The table below records that approved content in the canonical format without changing its substance.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Multiplicity explanation | Doplňující: proč jsou Tukeyho intervaly širší | After students see the three adjusted pairwise comparisons, explain simultaneous coverage conceptually. |
| 2 | Question-design extension | Doplňující: plánované kontrasty a post-hoc porovnání nejsou stejná otázka | Contrast prespecified biological questions with systematic post-hoc searching, without adding computation. |
| 3 | Variance-assumption response | Doplňující: co když se skupiny liší variabilitou? | After the diagnostic assumption statement, name bounded alternatives and return the choice to the biological question. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Simultaneous Tukey coverage | Students know one CI and understand that several species pairs are examined. | Simultaneous coverage protects a family of comparisons and costs precision per interval. | Derivation of Tukey's distribution. | Use the existing three pairwise comparisons. |
| Planned contrasts and post-hoc comparisons | Students know overall and pairwise tests. | A prespecified biological contrast differs from searching all pairs after the overall result. | Contrast matrices or new R packages. | Conceptual hand-off to advanced courses. |
| Unequal group variability | Students know residual spread and the Welch-versus-pooled t-test distinction. | Unequal spread changes the uncertainty calculation; it does not automatically erase a biological difference. | Welch-ANOVA details, robust SE formulas or transformation choice. | Link the existing Welch warning with the diagnostic plots. |

## Leakage audit

- Alternatives are named only after students understand the ordinary model and its diagnostic issue.
- No universal variance-test or correction threshold is introduced.

## Review and validation

- Independent amendment review: passed; the percentage explanation was checked as a fixed conceptual level rather than a data-derived result.
- Glossary coverage: checked for the added prose; no missing first-occurrence wrapper was identified.
- Source checks: UTF-8 without BOM, no replacement characters, `git diff --check` passed.
- Render: project-native HTML and PDF render passed; all 49 PDF pages were inspected through eight-page contact sheets, and new-content pages 41 and 45 were checked at readable size with no clipping, overlap, broken glyphs or orphaned blocks.
- Pre-existing full-artifact review notes outside this amendment: two existing equation progressions and one model-derived figure caption remain candidates for a later cleanup.
