# L06 generated images: placements and prompts

This file records every AI-generated image used or proposed for the L06 presentation, as required by `_internal/.ai/authoring/presentation.md` ("Lesson illustration series" and "Required lesson-derived title image"). Each entry lists the target slide, teaching role, prompt, Czech alt text and status.

Slides are identified by their heading because slide numbers change with each revision.

## Shared style rules

- **Characters for L06:** Palmer Archipelago penguins of the three lesson species (Adélie, Chinstrap, Gentoo) as small research groups on sea ice, each group gathering around its own flag. The flag stands for the group mean; this metaphor recurs across the series.
- **Style:** warm storybook natural-history watercolour/gouache with gentle academic humour; natural anatomy; clean silhouettes readable from the back of a lecture hall.
- **Background:** genuinely transparent RGBA cutouts, without parchment sky, water washes, painted colour fields or halos; physical ice-floe props remain. The 2026-10-09 refresh uses the detailed feather brushwork and expressive faces of the L04/L05 series as visual references.
- **Brand palette as accents:** graphite `#2E2E2E`, grey `#8A8A8A`, indigo `#5D2890`, amethyst `#86579E`, orange `#F3A712`, parchment `#F4F1EC`.
- **Colour meaning inside the pictures:** grey = observed individuals; purple = model or estimate (for example group flags); dark graphite = reference; orange only as a small focus accent.
- **Do not include** text, numbers, letters, logos, watermarks, axes, charts or data claims.
- **Never reveal an answer:** no image on a prediction or MCQ slide where it would give the answer away.
- **On the slide:** Czech `fig-alt`, the visible disclosure „Ilustrace vytvořená pomocí AI.“ (`.text-size-tiny .text-right`) and a speaker note explaining the metaphor.

## Original in-deck illustrations (superseded 2026-10-09)

All four images were added with the presentation in commit `fb645f4` (2026-08-12). The generation tool, exact prompts and generation date were not recorded in the L06 workflow records; those fields remain unknown. The descriptions below are reconstructed from the images and their slide roles.

| File | Slide | Teaching role | Czech alt text | SHA-256 |
|---|---|---|---|---|
| `ice_floe_laboratory.png` | „Dvě vzdálenosti na jedné kře“ | Makes the two distances concrete before any formula: individuals around their own flag (within groups) and flags apart from each other (between groups). | Dvě skupiny tučňáků na ledových krách: jedna stojí těsně u sebe, druhá je rozptýlená kolem svého praporku. | `fee7789a78fa4ef7c5ef8c4ccef91f96be25bf07c219b1a9a98b19595ec00feb` |
| `penguin_model_passport.png` | „Referenční druh“ | Metaphor for the reference level: one group is recorded directly, the others as a route (difference) from it. | Tři tučňáci u registračního místa; jeden představuje referenční skupinu a cesty k ostatním znázorňují rozdíly vůči ní. | `aa81b5d80b9cf7f08c3129a1ccc54f09462137bb00aef62e3ed5b2057a26151e` |
| `one_vs_three_feeding_flags.png` | „Jeden nebo tři?“ | Contrasts the null model (one shared flag, one mean) with the group model (three flags, three means) before sums of squares are introduced. | Tři skupiny tučňáků se nejprve orientují podle jednoho společného praporku a potom podle tří skupinových praporků. | `b4ac06a44a0be717b3f2a3ac59c37a1ddfe4e39661badcb6f503c5af91c3e0ea` |
| `penguin_group_magnifying_glass.png` | „Od celkové otázky ke dvojicím“ | Turning point from the overall ANOVA question to pairwise (post-hoc) questions. | Lupa zvýrazňuje dvojici ze tří tučňáků a připomíná přechod od celkové otázky ANOVA ke srovnání dvojic. | `2cb3f562d47e710bd43a539883f591ee5a33db3c8ef95f21a74ac607f0d4eef1` |

Historical status: all four original versions were approved with the presentation (Stage 5, 2026-08-12). Disclosure, alt text and speaker notes were standardised on 2026-10-09. They were replaced by the transparent painterly versions recorded below; this table retains the original hashes and provenance uncertainty.

## Original title-image brief (completed 2026-10-09)

The brief below was completed in the transparent refresh recorded below. The new title image is embedded and was accepted by Ondřej Mottl on 2026-10-09 („Title image is done“). The earlier 2026-10-08 release exception remains historical and does not approve these new images.

Proposed brief, to be generated from actual lesson assets:

- **File name:** `tucnaci_titulni_kompozice.png`.
- **Reference assets:** `lter_penguins.png` (Allison Horst, CC0 via palmerpenguins; species identity and colours), `body_mass_by_species.png` (anchor graph of body mass by species), `ice_floe_laboratory.png` and `one_vs_three_feeding_flags.png` (series characters and the flag metaphor).
- **Prompt (draft):** "Warm storybook watercolour/gouache illustration, gentle academic humour. On Antarctic sea ice, three small groups of penguins (Adélie, Chinstrap, Gentoo, anatomically natural) each stand around their own purple flag; the Gentoo flag stands noticeably higher on a raised ice block, the Adélie and Chinstrap flags at almost the same height. A curious young penguin researcher looks from one flag to the others. Parchment sky, graphite outlines, grey penguins with small orange accents. Wide 16:9 composition with calm empty space on the left for the title text. No text, numbers, letters, axes, charts, logos or watermarks."
- **Czech alt text (draft):** „Ilustrace tří skupin tučňáků na ledu, každá u svého fialového praporku; praporek tučňáků oslích stojí výrazně výše než praporky tučňáků kroužkových a uzdičkových. Ilustrace vytvořená pomocí AI.“
- **Required after generation:** layout with `.course-title-illustrated`, visible AI disclosure and attribution for the Allison Horst reference, provenance row (tool, date, file name, SHA-256), and inspection of the title slide in HTML and PDF.

## Provenance of future images

| File | Tool | Date | SHA-256 |
|---|---|---|---|
| `tucnaci_titulni_kompozice.png` | built-in image_gen | 2026-10-09 | `97e6b674ce0f925dc1ae747c609dabbc48514bffddf9e4f1b1280a9e793778b5` |

## Transparent illustration refresh (2026-10-09)

Requested by Ondřej Mottl: update L06 illustrations to match L04/L05, with no background. All four original in-deck illustrations were redrawn with the built-in image_gen tool, preserving their teaching roles and filenames. The title brief was completed from the lesson anatomy illustration, actual body-mass plot and refreshed series. Ondřej Mottl accepted the refreshed images and the title image on 2026-10-09; the original 2026-08-12 approval applies to the earlier versions. The story-map amendment was approved the same day (see the review-polish record).

### Current provenance

| File | Tool | Date | SHA-256 | Placement |
|---|---|---|---|---|
| `ice_floe_laboratory.png` | built-in image_gen | 2026-10-09 | `4b8d472a79d72638a2be8c0765beac5947938f21385126afbd048e5b1dbc5f3a` | Dvě vzdálenosti na jedné kře |
| `penguin_model_passport.png` | built-in image_gen | 2026-10-09 | `6fc97de3ec7a9fd1bd4816738c1376837c0cbd8ce411a85682845f47e55f288d` | Referenční druh |
| `one_vs_three_feeding_flags.png` | built-in image_gen | 2026-10-09 | `663b5164f34b2e33824906b6d1e1a77549b73de7197fb88e1b5473b8eba5e943` | Jeden nebo tři? |
| `penguin_group_magnifying_glass.png` | built-in image_gen | 2026-10-09 | `c90f252bd8cacdd2ede18114e398a2114dd1bf1b7a8bb9c25a1c5c97c4b16912` | Od celkové otázky ke dvojicím |
| `tucnaci_titulni_kompozice.png` | built-in image_gen | 2026-10-09 | `97e6b674ce0f925dc1ae747c609dabbc48514bffddf9e4f1b1280a9e793778b5` | Title |

### Exact submitted prompts: in-deck replacements

Each first-pass call supplied four references in this exact order: (1) the original L06 file being replaced (edit target), (2) `L04/Presentation/Materials/geyser_team_photo.png` (painterly style only), (3) `L05/Presentation/Materials/krabi_mereni_v_se.png` (painterly style only), (4) `L06/Presentation/Materials/lter_penguins.png` (species anatomy only). All references were visually inspected. Each call set `transparent_background: true`.

#### 1. `ice_floe_laboratory.png`

```text
Use case: style-transfer / scientific-educational.
Asset type: transparent painterly illustration for a Czech university biostatistics slide.
Input Image 1 is the L06 EDIT TARGET: preserve its statistical teaching metaphor and spatial arrangement, but redraw the characters and props at substantially higher quality. Input Image 2 (L04 bison/marmot/raven) and Input Image 3 (L05 crab researchers) are STYLE REFERENCES ONLY: match their warm richly textured natural-history watercolour/gouache, fine brushwork, tactile feather detail, expressive curious animal faces and gentle academic humour. Do not introduce bison, crabs or any other species. Input Image 4 (Allison Horst penguins, CC0) is an ANATOMY REFERENCE ONLY: Adélie has white eye rings and dark bill, Chinstrap has a narrow dark line beneath its white face and dark bill, Gentoo has a broad white crown stripe and orange-red bill. Do not copy its signature, flat graphic style or coloured background patches.
Style: lovingly painted storybook field researchers; natural penguin proportions and flippers, slightly varied poses and individual personalities. Black/graphite and white/soft-grey plumage with natural subdued feet and bill colours. Plain purple flags or model accessories (#5D2890, #86579E), graphite reference (#2E2E2E), restrained small orange focus (#F3A712), parchment props (#F4F1EC). Readable silhouettes at lecture-slide size.
Transparency: genuinely transparent RGBA cutout; clean alpha edges, transparent empty space between subjects and around the entire composition. Remove the entire parchment rectangle, sky, water wash, halo and background colour field. A compact painted ice floe is a physical foreground prop and may remain. All subjects fully inside the frame, 5% transparent padding. Wide landscape about 16:9. NO text, letters, numbers, scales, chart axes, equations, logos or watermarks. No invented statistical results.
Scene: exactly two distinct ice floes separated by a clear transparent gap. Around one plain purple flag on the left, about five Adélie penguins stand close together; around one plain purple flag on the right, about five Gentoo penguins stand visibly dispersed. The two flags are separated, making within-group distance and between-group distance intuitive. Keep both floes comparable in scale; no arrows or lines, no labels. Penguin heads and faces large enough to show the tactile painterly detail; do not repeat tiny identical clipart figures.
```

#### 2. `penguin_model_passport.png`

```text
Use case: style-transfer / scientific-educational.
Asset type: transparent painterly illustration for a Czech university biostatistics slide.
Input Image 1 is the L06 EDIT TARGET: preserve its statistical teaching metaphor and spatial arrangement, but redraw the characters and props at substantially higher quality. Input Image 2 (L04 bison/marmot/raven) and Input Image 3 (L05 crab researchers) are STYLE REFERENCES ONLY: match their warm richly textured natural-history watercolour/gouache, fine brushwork, tactile feather detail, expressive curious animal faces and gentle academic humour. Do not introduce bison, crabs or any other species. Input Image 4 (Allison Horst penguins, CC0) is an ANATOMY REFERENCE ONLY: Adélie has white eye rings and dark bill, Chinstrap has a narrow dark line beneath its white face and dark bill, Gentoo has a broad white crown stripe and orange-red bill. Do not copy its signature, flat graphic style or coloured background patches.
Style: lovingly painted storybook field researchers; natural penguin proportions and flippers, slightly varied poses and individual personalities. Black/graphite and white/soft-grey plumage with natural subdued feet and bill colours. Plain purple flags or model accessories (#5D2890, #86579E), graphite reference (#2E2E2E), restrained small orange focus (#F3A712), parchment props (#F4F1EC). Readable silhouettes at lecture-slide size.
Transparency: genuinely transparent RGBA cutout; clean alpha edges, transparent empty space between subjects and around the entire composition. Remove the entire parchment rectangle, sky, water wash, halo and background colour field. A compact painted ice floe is a physical foreground prop and may remain. All subjects fully inside the frame, 5% transparent padding. Wide landscape about 16:9. NO text, letters, numbers, scales, chart axes, equations, logos or watermarks. No invented statistical results.
Scene: a rustic compact registration counter on one ice floe, with one Adélie penguin behind the counter holding a blank open parchment booklet; a Chinstrap penguin to the left and Gentoo to the right each hold another blank open booklet. Exactly three penguins. One graphite reference mark on the central booklet and two plain purple dotted routes lead from the central counter to the side penguins, conveying differences from a common reference. No written entries, circular letter-like stamps or numbers. Preserve the central reference and two routes; expressive curious researcher faces and realistic feather texture.
```

#### 3. `one_vs_three_feeding_flags.png`

```text
Use case: style-transfer / scientific-educational.
Asset type: transparent painterly illustration for a Czech university biostatistics slide.
Input Image 1 is the L06 EDIT TARGET: preserve its statistical teaching metaphor and spatial arrangement, but redraw the characters and props at substantially higher quality. Input Image 2 (L04 bison/marmot/raven) and Input Image 3 (L05 crab researchers) are STYLE REFERENCES ONLY: match their warm richly textured natural-history watercolour/gouache, fine brushwork, tactile feather detail, expressive curious animal faces and gentle academic humour. Do not introduce bison, crabs or any other species. Input Image 4 (Allison Horst penguins, CC0) is an ANATOMY REFERENCE ONLY: Adélie has white eye rings and dark bill, Chinstrap has a narrow dark line beneath its white face and dark bill, Gentoo has a broad white crown stripe and orange-red bill. Do not copy its signature, flat graphic style or coloured background patches.
Style: lovingly painted storybook field researchers; natural penguin proportions and flippers, slightly varied poses and individual personalities. Black/graphite and white/soft-grey plumage with natural subdued feet and bill colours. Plain purple flags or model accessories (#5D2890, #86579E), graphite reference (#2E2E2E), restrained small orange focus (#F3A712), parchment props (#F4F1EC). Readable silhouettes at lecture-slide size.
Transparency: genuinely transparent RGBA cutout; clean alpha edges, transparent empty space between subjects and around the entire composition. Remove the entire parchment rectangle, sky, water wash, halo and background colour field. A compact painted ice floe is a physical foreground prop and may remain. All subjects fully inside the frame, 5% transparent padding. Wide landscape about 16:9. NO text, letters, numbers, scales, chart axes, equations, logos or watermarks. No invented statistical results.
Scene: two separate ice-floe arrangements side by side, without rectangular panel borders. LEFT: three recognisably different species clusters (two Adélie, two Chinstrap, two Gentoo) around exactly ONE shared plain purple flag. RIGHT: the same three species clusters (two of each) each around its own flag, exactly THREE purple flags total on the right. No other flags. The clear one-versus-three contrast is the priority; varied natural poses and detailed painterly feathers, not identical generic penguin icons. Do not encode a significance result or relative mean heights.
```

#### 4. `penguin_group_magnifying_glass.png`

```text
Use case: style-transfer / scientific-educational.
Asset type: transparent painterly illustration for a Czech university biostatistics slide.
Input Image 1 is the L06 EDIT TARGET: preserve its statistical teaching metaphor and spatial arrangement, but redraw the characters and props at substantially higher quality. Input Image 2 (L04 bison/marmot/raven) and Input Image 3 (L05 crab researchers) are STYLE REFERENCES ONLY: match their warm richly textured natural-history watercolour/gouache, fine brushwork, tactile feather detail, expressive curious animal faces and gentle academic humour. Do not introduce bison, crabs or any other species. Input Image 4 (Allison Horst penguins, CC0) is an ANATOMY REFERENCE ONLY: Adélie has white eye rings and dark bill, Chinstrap has a narrow dark line beneath its white face and dark bill, Gentoo has a broad white crown stripe and orange-red bill. Do not copy its signature, flat graphic style or coloured background patches.
Style: lovingly painted storybook field researchers; natural penguin proportions and flippers, slightly varied poses and individual personalities. Black/graphite and white/soft-grey plumage with natural subdued feet and bill colours. Plain purple flags or model accessories (#5D2890, #86579E), graphite reference (#2E2E2E), restrained small orange focus (#F3A712), parchment props (#F4F1EC). Readable silhouettes at lecture-slide size.
Transparency: genuinely transparent RGBA cutout; clean alpha edges, transparent empty space between subjects and around the entire composition. Remove the entire parchment rectangle, sky, water wash, halo and background colour field. A compact painted ice floe is a physical foreground prop and may remain. All subjects fully inside the frame, 5% transparent padding. Wide landscape about 16:9. NO text, letters, numbers, scales, chart axes, equations, logos or watermarks. No invented statistical results.
Scene: exactly three penguins on one compact ice floe, left Adélie, middle Chinstrap, right Gentoo. A large graphite-and-wood magnifying glass in the foreground encloses ONLY the first two penguins, highlighting a pair; the Gentoo remains clearly outside its circular rim. Glass optically clear with only subtle highlights, no painted colour field inside the lens. Do not duplicate penguins inside the lens or add a fourth penguin. Warm expressive faces, natural anatomy and exquisitely textured feather brushwork.
```

#### Pairwise illustration: framing correction

The first magnifying-glass output placed its upper rim too close to the canvas edge. A second built-in edit supplied that first output as its only edit target, again with `transparent_background: true`. This second output is the saved final asset.

```text
Use case: precise-object-edit. Input image is the EDIT TARGET. Fix framing only: zoom out the entire illustrated composition enough to leave generous truly transparent padding on every side (at least 6% of canvas height above the top of the magnifying-glass rim and below the ice). The ENTIRE magnifying glass including its circular top rim must be fully inside the image and uncut. Preserve exactly the existing three penguins (Adélie and Chinstrap inside the glass, Gentoo outside), their feather brushwork, identities, natural anatomy, graphite/wood glass, clear lens and ice floe. Preserve the landscape 16:9 aspect and genuinely transparent alpha background. Do not add any text, numbers, markings, sky, colour field or objects. Keep all of the composition, including the handle and bottom of ice, fully visible.
```

### Exact submitted title prompt

The title call supplied five inspected references in this order: Allison Horst anatomy illustration, lesson body-mass plot, refreshed ice-floe illustration, refreshed one-versus-three illustration, and L05 crab style reference. It set `transparent_background: true`. The earlier draft's parchment sky and wide framing were superseded by true transparency and the portrait composition required by the existing illustrated-title layout.

```text
Use case: compositing / scientific-educational.
Asset type: transparent painterly title-slide illustration for L06, a Czech university biostatistics lesson comparing mean body mass of Adélie, Chinstrap and Gentoo penguins. Portrait composition about 4:5, to fit right-hand 36% of a deep indigo title slide.
Input Image 1: Allison Horst's CC0 penguin illustration, ANATOMY REFERENCE only: species identities (Adélie white eye rings and dark bill; Chinstrap white face and thin black chin line; Gentoo broad white crown stripe and orange-red bill), not its flat style, coloured patches or signature.
Input Image 2: actual lesson body-mass-by-species plot, QUALITATIVE DATA STORY REFERENCE only: Adélie and Chinstrap mean masses are similar, Gentoo mean mass greater. Do not reproduce axes, data points, numbers, labels or plot.
Input Images 3 and 4: newly redrawn L06 ice-floe and one-versus-three illustrations, PRIMARY character, richly textured natural-history watercolour/gouache style and purple-flag metaphor references.
Input Image 5: L05 painterly crab researchers, supporting STYLE REFERENCE only, no crabs in output.
Scene: three little penguin research groups on a compact stepped Antarctic ice platform, two penguins of each species. Adélie group at lower left with one plain purple flag; Chinstrap at lower right with one plain purple flag at almost the same elevation; Gentoo group above and behind on a distinctly raised ice block with its own plain purple flag. Exactly three flags, each meaning a group mean. One foreground Adélie turns its head curiously between the flags. Gentle academic humour through lively curious poses, natural flippers and proportionate bodies, delicate layered feather brushwork and tactile gouache ice texture.
Composition: a coherent scene, not a panel grid or pasted collage; large readable characters, three unobstructed flags; comfortably centred with at least 7% transparent padding on ALL sides. No subjects touching or cropped by the frame.
Palette: natural black/graphite and warm white/grey plumage, pale blue ice; flags indigo #5D2890 / amethyst #86579E; small natural orange bill/foot accents; no bright categorical background patches.
Constraints: genuinely transparent RGBA background with clean alpha edges; no parchment sky, painted backdrop, colour wash or haze outside physical subjects. NO text, numbers, letters, axes, charts, labels, equations, logos, signatures or watermarks. No numerical mass, p-value or test outcome. Output only the illustration; all title text remains editable in the slide.
```

### Title integration

- File: `tucnaci_titulni_kompozice.png`, 1122 × 1402 px, RGBA with true transparency.
- Role: introduces the biological body-mass question through three species groups and their purple mean flags. Gentoo stands higher on an ice block; Adélie and Chinstrap stand at similar elevations. Elevation is a qualitative metaphor, not a measurement scale or test result.
- Czech alt text: „Tři skupiny tučňáků na ledu u fialových praporků; tučňáci oslí a jejich praporek stojí na vyšším ledovém bloku než tučňáci kroužkoví a uzdičkoví. Ilustrace vytvořená pomocí AI.“
- Uses `.course-title-illustrated`, `include_local_figure()`, editable title text, visible AI disclosure, Allison Horst attribution and a speaker note. In-deck alt texts and metaphors remain applicable to the replacement images.
- The title-image open item is resolved and accepted; the remaining lesson review and publication gates are listed in the review-polish record.

### Reference provenance and reuse terms

| Reference | Role and reuse terms | SHA-256 |
|---|---|---|
| Original four L06 illustrations | Edit targets; original generation tool/date/prompt unknown. Earlier file hashes remain in the historical table above. Original bytes are also saved locally in ignored `Temp/image-qa/originals/`. Existing course educational-content terms apply; no newly verified third-party licence is asserted. | See historical table |
| `L04/Presentation/Materials/geyser_team_photo.png` | Painterly fur/feather texture, character expression and warm natural-history style only. Course AI illustration, built-in image generation, 2026-10-08; exact prompt and provenance in L04's `GENERATED_IMAGES.md`. Repository educational-content terms (CC BY 4.0 where applicable). | `7d00880a60c414e8d2a7d119b04308254bd84f49b4404ceb7f05970496995b10` |
| `L05/Presentation/Materials/krabi_mereni_v_se.png` | Painterly texture and purple-model-object styling only. Course AI illustration, built-in image_gen, 2026-10-09; exact prompt and provenance in L05's `GENERATED_IMAGES.md`. Repository educational-content terms (CC BY 4.0 where applicable). | `d01d80191731b0cc1db055ef9f3d65ec184dc1683f22ee978b4d61df9f77c9ff` |
| `lter_penguins.png` | Species anatomy reference. Allison Horst, CC0, distributed through palmerpenguins; attribution retained on the original species slide and new title. No signature, flat graphic style or coloured background patches copied into the new illustrations. | `09b8d656b7e432aff84e961af5a3bbb46cf0291ee08f43dd42224dcf2abb7245` |
| `body_mass_by_species.png` | Original lesson plot generated by `presentation.qmd`; qualitative mean-mass pattern only. The original graph remains a separate teaching figure. Repository educational-content terms apply to original figure content; underlying data retain their source terms. | `8e5e7d1cd16132204ccfad873dc46c9b236b8b5a3c9499b9927cd1ce431534ea` |
| Refreshed `ice_floe_laboratory.png`, `one_vs_three_feeding_flags.png` | Title-series character and flag-metaphor references; generated in this refresh, with prompts and hashes above. Repository educational-content terms (CC BY 4.0 where applicable). | See current provenance |

### Validation (2026-10-09)

All five final PNGs were visually inspected and checked for genuine RGBA transparency; 49.9–60.7% of their pixels are fully transparent, both alpha extrema are present, and canvas corners are transparent. Four landscape files are 1672 × 941 px; the title is 1122 × 1402 px. Saved hashes match the current provenance table. No background extraction or raster retouching was performed outside image_gen.

The canonical `R/render_presentation.R` wrapper completed locally in offline mode using `BIOSTAT_POLLSLIVE_CLIENT_SOURCE=D:/GITHUB/CUNI-NATUR-Biostatistics/_internal` and the existing lesson theme (`options(biostat.theme_sync_complete = TRUE)`). The final deck remains 73 slides/pages. Slides 1, 14, 21, 46 and 61 were visually inspected in HTML at 1600 × 900 and in PDF: illustrations fit, the two/three-species metaphors remain clear, disclosures are visible, and the title retains readable editable text and Allison Horst attribution. The HTML QA waits for image loading and recalculates Reveal layout before checking visible image dimensions. The PDF pages were rasterised with installed PyMuPDF because Poppler is unavailable. `Presentation/presentation.html` and `docs/index.html` are byte-identical. UTF-8 without BOM, no replacement characters and the focused QMD whitespace check passed. Broad worktree diff checks encounter generated HTML/PDF whitespace; they are not a source-validation pass. QA evidence, scripts and original assets are in ignored `Temp/image-qa/`.

This is a local image refresh and validation render. No synchronized PollsLive render, Git publication or public deployment was performed. It does not replace the full-artifact reviews already recorded for the lesson polish.
