#----------------------------------------------------------#
#
#
#             CUNI-NATUR-Biostatistics L06
#
#          Render PollsLive retrieval evidence
#               - the quiz retrieves L05
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

# Reproducible source of the evidence images. Local PollsLive preparation
#   runs R/verify_pollslive_assets.R, which checks the approved bytes.
#   l05-p-value-tails.png stays a byte-identical copy of the L05 figure
#   Presentation/Materials/p_hodnota_chvosty.png.

here::i_am("R/render_pollslive_assets.R")

source(here::here("R", "set_r_theme.R"))
# Pixel canvases use 150 DPI; match showtext font metrics to the save device.
showtext::showtext_opts(dpi = 150)

path_assets <-
  here::here("pollslive", "assets")

path_source <-
  here::here("pollslive", "source", "pie_crab_site_means.csv")

save_asset <- function(plot, filename, height) {
  plot_canvas <-
    plot +
    ggview::canvas(
      width = 1600,
      height = height,
      units = "px",
      dpi = 150
    )

  res_file <-
    ggview::save_ggplot(
      plot = plot_canvas,
      file = here::here(path_assets, filename)
    )

  return(invisible(res_file))
}

theme_card <-
  ggplot2::theme_void() +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = biostat_cols[["white"]],
      colour = NA
    )
  )


#----------------------------------------------------------#
# 1. Fit the L05 model -----
#----------------------------------------------------------#

stopifnot(
  identical(
    digest::digest(file = path_source, algo = "sha256"),
    "2280d4bc56723c778c6f52d0440b616d9ee23d180634228f98ce30ed7c047141"
  )
)

data_lokality <-
  utils::read.csv(file = path_source)

mod_krabi <-
  stats::lm(
    formula = prumerna_sirka_mm ~ zemepisna_sirka,
    data = data_lokality
  )

mat_coef_krabi <-
  base::round(stats::coef(base::summary(mod_krabi))[, 1:2], 2)

stopifnot(
  base::nrow(data_lokality) == 13L,
  base::sum(data_lokality[["pocet_krabu"]]) == 392L,
  stats::df.residual(mod_krabi) == 11L,
  mat_coef_krabi["zemepisna_sirka", "Estimate"] == 0.49,
  mat_coef_krabi["zemepisna_sirka", "Std. Error"] == 0.08
)


#----------------------------------------------------------#
# 2. Q1: estimate and SE without t, df or p -----
#----------------------------------------------------------#

vec_console_lines <-
  c(
    "> round(coef(summary(mod_krabi))[, 1:2], 2)",
    utils::capture.output(base::print(mat_coef_krabi)),
    "> nrow(data_lokality)",
    utils::capture.output(base::print(base::nrow(data_lokality))),
    "> sum(data_lokality$pocet_krabu)",
    utils::capture.output(
      base::print(base::sum(data_lokality[["pocet_krabu"]]))
    )
  )

vec_console_colours <-
  base::ifelse(
    stringr::str_detect(vec_console_lines, "^>"),
    biostat_cols[["grey_olive"]],
    biostat_cols[["graphite"]]
  )

plot_console <-
  ggplot2::ggplot() +
  ggplot2::coord_cartesian(
    xlim = c(0, 1),
    ylim = c(0.5, base::length(vec_console_lines) + 0.5)
  ) +
  theme_card +
  ggplot2::annotate(
    geom = "text",
    x = 0.06,
    y = base::rev(base::seq_along(vec_console_lines)),
    label = vec_console_lines,
    hjust = 0,
    family = biostat_mono_font,
    size = 8,
    colour = vec_console_colours
  )

save_asset(
  plot = plot_console,
  filename = "l05-odhad-se-lokality.png",
  height = 700
)


#----------------------------------------------------------#
# 3. Q3: a hypothetical small study -----
#----------------------------------------------------------#

# A hypothetical study of four sites; the numbers are internally consistent
#   for df = 2 (estimate 0.45, SE 0.151).
odhad_mala <- 0.45
se_mala <- 0.151
df_mala <- 2

vec_ci_mala <-
  odhad_mala + c(-1, 1) * stats::qt(p = 0.975, df = df_mala) * se_mala

p_mala <-
  2 * stats::pt(q = -base::abs(odhad_mala / se_mala), df = df_mala)

stopifnot(
  base::all(base::round(vec_ci_mala, 2) == c(-0.20, 1.10)),
  base::round(p_mala, 2) == 0.10
)

vec_ci_krabi <-
  stats::confint(mod_krabi)["zemepisna_sirka", ]

stopifnot(
  base::all(base::round(vec_ci_krabi, 2) == c(0.31, 0.66)),
  stats::coef(base::summary(mod_krabi))["zemepisna_sirka", 4] < 0.001
)

# Our L05 study beside the hypothetical small study, so that students can
#   check which slopes the small study's interval is compatible with.
vec_nase_lines <-
  c(
    "Naše studie: 13 lokalit",
    "Sklon: 0,49 mm/°",
    "95% interval: [0,31; 0,66] mm/°",
    "p < 0,001"
  )

vec_mala_lines <-
  c(
    "Nová studie: 4 lokality",
    "Sklon: 0,45 mm/°",
    "95% interval: [−0,20; 1,10] mm/°",
    "p = 0,10"
  )

vec_card_colours <-
  c(
    biostat_cols[["indigo_velvet"]],
    biostat_cols[["graphite"]],
    biostat_cols[["graphite"]],
    biostat_cols[["graphite"]]
  )

plot_mala_studie <-
  ggplot2::ggplot() +
  ggplot2::coord_cartesian(
    xlim = c(0, 1),
    ylim = c(0.5, 4.5)
  ) +
  theme_card +
  ggplot2::annotate(
    geom = "text",
    x = base::rep(c(0.03, 0.53), each = 4),
    y = base::rep(4:1, times = 2),
    label = c(vec_nase_lines, vec_mala_lines),
    hjust = 0,
    family = biostat_base_font,
    fontface = base::rep(c("bold", "plain", "plain", "plain"), times = 2),
    size = 7,
    colour = base::rep(vec_card_colours, times = 2)
  )

save_asset(
  plot = plot_mala_studie,
  filename = "l05-mala-studie.png",
  height = 500
)
