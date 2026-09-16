# L06 PollsLive retrieval quiz: integration map and exact questions

- Date: 2026-09-16
- Branch: `lesson/l06-presentation-standards`
- Workstream: focused post-presentation standards retrofit

Integration-map status: approved.

Exact-question status: approved.

Human approval: approved by the human author in this session on 2026-09-16, without requested revisions.

## Scope and integration map

The retrieval block replaces only `Co víme z minulé lekce?`. It appears after `Výsledky učení` and before `Podíváme se na data`; it ends with `Stejná logika, jiný typ prediktoru`.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Interpret a p-value conditionally | L05 p-value misconception check | Use the same inferential logic for a group coefficient. |
| Q2 | Classify a decision error | L05 Type I/II block | Decisions can be wrong for group comparisons too. |
| Q3 | Choose an effect-first conclusion | L05 closing scientific conclusion | L06 changes the predictor from numeric to categorical. |

## Exact production questions

### Q1 — conditional p-value

**Evidence:** approved L05 two-tailed null-distribution graphic and its observed statistic.

**Question:** Která věta správně čte malou p-hodnotu?

1. Nulová hypotéza má malou pravděpodobnost, že je pravdivá.
2. Pokud platí nulový model, výsledek alespoň tak extrémní jako náš by byl velmi neobvyklý. — **correct**
3. Biologický efekt musí být velký.
4. Studie dokázala příčinný vztah.

**Explanation:** P-hodnota je podmíněná nulovým modelem. Neudává pravděpodobnost hypotézy ani velikost či biologický význam efektu.

### Q2 — decision error

**Evidence:** L05 decision scenario: test označí efekt, ačkoli ve skutečnosti žádný systematický efekt není.

**Question:** Jaký typ chyby nastal?

1. Chyba I. stupně — **correct**
2. Chyba II. stupně
3. Bezchybný závěr
4. Výběrová variabilita nemůže takový výsledek vytvořit

**Explanation:** Chyba I. stupně je falešně pozitivní rozhodnutí: zamítneme nulovou hypotézu, přestože v popsaném světě platí.

### Q3 — effect-first conclusion

**Evidence:** familiar L05 crab result card showing the estimated slope, its interval, p-value, and observational limitation.

**Question:** Který závěr je vědecky nejúplnější?

1. P-hodnota je malá, proto je vztah biologicky důležitý.
2. Nulová hypotéza je nepravdivá s pravděpodobností odpovídající p-hodnotě.
3. Ve sledovaných lokalitách se šířka krunýře směrem k severu zvětšovala; uvedeme odhad s intervalem a připomeneme observační omezení. — **correct**
4. Nevýznamný výsledek by dokazoval, že žádný efekt neexistuje.

**Explanation:** Závěr začíná efektem v biologických jednotkách, doplní nejistotu a důkaz a respektuje rozsah observačních dat.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence |
|---|---|---|
| Conditional interpretation of the p-value | yes | L05 p-value block |
| Type I and Type II errors | yes | L05 decision block |
| Effect-first cautious conclusion | yes | L05 closing block |
| Reference coding, categorical coefficients, ANOVA, post-hoc tests | no | introduced in L06 |

## Evidence and accessibility

All evidence is regenerated from the approved L05 source objects or copied with pinned hashes. The participant question and native fallback use the same artifact, Czech alt text, and provenance. No response was submitted during local validation.

## Implementation and validation

- `pollslive/quiz.json` uses schema version 2 and contains the three approved questions.
- The standard include is placed immediately after the learning outcomes and is followed by the approved bridge.
- `node pollslive/validate.mjs` passes without credentials.
- All R chunks parse; checked source files are UTF-8 without BOM or replacement characters; no duplicate chunk labels were found.
- Offline PollsLive rendering completed through the canonical presentation wrapper. The final PDF has 69 pages, and `Presentation/presentation.html` is byte-identical to `docs/index.html`.
- The generated `active.qmd`, `offline.qmd`, and `static.qmd` each contain all three questions and no development URL or placeholder.
- Focused PDF inspection covered the quiz fallback and the bridge.

### Final evidence checksums (SHA-256)

- `pollslive/assets/l05-p-value-tails.png`: `7D0AF829F0E0ACCB6D93121748BBDEF8AF4B9C717B3F6694CC9555930B43621A`
- `pollslive/assets/l05-type-i-error.jpg`: `C4473F17924C95D164C13D1C82F374540A74CCCB1FC6B0EAA00AD1E127260228`
- `pollslive/assets/l05-effect-first-conclusion.png`: `09BAA768BFA852A78C694D732B782BD8E547C2528B10C2BEF0E903C3C326180B`
- `pollslive/source/pie_crab_site_means.csv`: `2280D4BC56723C778C6F52D0440B616D9EE23D180634228F98CE30ED7C047141`

## Independent review

The first read-only review found answer-revealing evidence in L03 Q1 and L04 Q1/Q2, literal Markdown markers in fallback text, and incomplete workflow evidence. The evidence cards and quiz text were corrected and rerendered. The focused read-only re-review passed with no content or rendering blockers. It confirmed neutral L03 Q1 evidence, non-revealing L04 Q1/Q2 cards, clean fallback text, matching evidence hashes, approved include positions and bridges, and valid final PDFs.

## Operational limitations

Remote PollsLive synchronization, remote setting verification, QR/link testing on a second device, and schedule activation require an immutable pushed lesson commit and therefore remain pending. No remote poll operation was performed and no production response was submitted. Activation remains disabled.
