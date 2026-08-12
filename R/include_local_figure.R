include_local_figure <- function(data_source) {
  knitr::include_graphics(
    path = here::here(path_materials, data_source),
    error = TRUE
  )
}
