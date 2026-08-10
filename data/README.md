# L06 Palmer penguin teaching data

`palmer_penguins.csv` is prepared from `palmerpenguins::penguins` version 0.1.1, which is locked in this repository through `renv`. The prepared table retains all 344 observations and gives its eight variables Czech names so the lesson can show the removal of the two observations with missing body mass transparently.

- Package documentation: <https://allisonhorst.github.io/palmerpenguins/reference/penguins.html>
- Direct EDI-download workflow: <https://allisonhorst.github.io/palmerpenguins/articles/download.html>
- Package archive and citation: <https://doi.org/10.5281/zenodo.3960218>
- Associated ecological study: <https://doi.org/10.1371/journal.pone.0090081>
- Reuse: the package documentation makes the data available under CC0.

Run `Rscript R/prepare_penguin_data.R` from the repository root to recreate the CSV from the locked package. The principal lesson analysis uses `hmotnost_tela_g` as the numerical response and `druh` as the categorical predictor. The columns `pohlavi` and `ostrov` are retained so that the lesson can state its limitations honestly and motivate the next lesson without fitting a multiple-predictor model prematurely.
