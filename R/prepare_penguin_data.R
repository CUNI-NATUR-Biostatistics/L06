#----------------------------------------------------------#
#
#
#                          L06
#
#                 Prepare penguin data
#
#                     O. Mottl
#                       2026
#
#----------------------------------------------------------#

# Source and output paths -----

path_penguins <-
  here::here("data", "palmer_penguins.csv")


# Prepare a transparent Czech teaching table -----

data_penguins <-
  palmerpenguins::penguins |>
  dplyr::transmute(
    druh = as.character(species),
    ostrov = as.character(island),
    delka_zobaku_mm = bill_length_mm,
    hloubka_zobaku_mm = bill_depth_mm,
    delka_kridla_mm = flipper_length_mm,
    hmotnost_tela_g = body_mass_g,
    pohlavi = as.character(sex),
    rok = year
  )


# Validate and save -----

data_species_counts <-
  data_penguins |>
  dplyr::count(druh)

data_expected_counts <-
  tibble::tibble(
    druh = c("Adelie", "Chinstrap", "Gentoo"),
    n = c(152L, 68L, 124L)
  )

if (nrow(data_penguins) != 344L) {
  cli::cli_abort("Expected 344 penguin observations.")
}

if (!identical(data_species_counts, data_expected_counts)) {
  cli::cli_abort("Unexpected number of observations within species.")
}

count_missing_mass <-
  data_penguins |>
  dplyr::pull(hmotnost_tela_g) |>
  is.na() |>
  sum()

if (count_missing_mass != 2L) {
  cli::cli_abort("Expected two missing body-mass values.")
}

readr::write_csv(
  x = data_penguins,
  file = path_penguins
)
