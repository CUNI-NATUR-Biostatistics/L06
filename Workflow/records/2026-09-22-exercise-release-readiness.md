# Stage 6: L06 exercise release readiness

## Release target

- Prepared on 2026-09-22 after exercise PR #8 merged into `main` at `092568e4e4bf0de7633fb14334c485fbd73acdf3`.
- Target tag: `L06-v0.2.0-20260922`, without a Moodle ZIP.
- Previous stable release: `L06-v0.1.0-20260918`.
- Stable routes after publication: `/L06/current/` and `/L06/releases/L06-v0.2.0-20260922/`.
- The shared release workflow creates the GitHub Release, deploys Pages, and attempts an immediate HUB refresh when its GitHub App secrets are configured. If notification is skipped, report the missing HUB refresh rather than dispatching it without separate authorization.

## Bundle and public boundary

- The release manifest includes approved learning and presentation HTML, PDF, and QMD sources; the completed exercise script; the prepared Palmer Penguins CSV; and `LICENSE.md`.
- The exercise contains student prompts, expected-result criteria, and progressive hints, but no complete answer key, restricted assessment, student information, credentials, or private course administration.
- `data/palmer_penguins.csv` is the approved teaching table prepared from `palmerpenguins::penguins` version 0.1.1. Its `data/README.md` records the CC0 data release, package archive, and associated ecological study.
- `LICENSE.md` preserves the CC BY 4.0 educational-content / MIT software split and excludes third-party materials from those licenses.
- The public README gives direct stable links to the practical script and teaching CSV and distinguishes stable materials from `main` and preview.

## Pre-tag validation

- The completed exercise has explicit human approval and independent full and focused read-only reviews with no findings.
- The exercise parsed and sourced in a clean temporary project; an untracked reference harness solved all eight core and four optional tasks and confirmed the stated numerical results. Three diagnostic/output plots were visually inspected with correctly rendered Czech labels.
- L06 is public. GitHub Pages uses GitHub Actions, and the `github-pages` environment permits `main` and `L06-v*` tags.
- Learning and presentation HTML/PDF were committed and reviewed for the preceding stable release; this focused release change does not alter those artifacts.
- The canonical release packager built `web-materials-L06-v0.2.0-20260922.zip`. Its manifest contains nine public resource files plus `manifest.json`; every source exists and the generated manifest records SHA-256 checksums. The ZIP SHA-256 is `7FCDDF369BC85B4D518BB06D83D61A3EBA2ED143E0642CB018670A93CF693BCE`. Rerun the same packager after this release-fix commit is merged and before tagging.
- The 68-minute practical route remains an author estimate and has not been timed with beginners.

## Post-tag checks

- Confirm the tag points to the merged release-fix commit and that the GitHub Actions release, Pages, and optional HUB-notification jobs complete.
- Check that the GitHub Release contains `web-materials-L06-v0.2.0-20260922.zip`.
- Check `/L06/current/code/cviceni.R` and `/L06/current/data/palmer_penguins.csv`, plus the corresponding immutable release routes.
- Confirm the current alias selects `L06-v0.2.0-20260922` and record whether the HUB refreshed.
