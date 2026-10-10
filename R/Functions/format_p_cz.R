# CUNI-NATUR-Biostatistics L06 — Czech p-values for prose, 2026.
# Format p-values -----
# Very small p-values are reported as "< 0,001"; otherwise three
#   significant digits with a decimal comma.
format_p_cz <- function(p, eps = 0.001) {
  res_text <-
    format.pval(
      pv = p,
      digits = 3,
      eps = eps
    )

  res_text <-
    gsub(pattern = ".", replacement = ",", x = res_text, fixed = TRUE)

  res_text <-
    sub(pattern = "^<", replacement = "< ", x = res_text)

  return(res_text)
}
