# CUNI-NATUR-Biostatistics L06 — Czech explanatory numbers, 2026.
# Format numbers -----
# Decimal comma and a space between thousands, e.g. 1 375,4.
# Raw R output shown in visible chunks is unchanged.
format_cz <- function(x, digits = 1, nsmall = digits) {
  format(
    x = round(x = x, digits = digits),
    nsmall = nsmall,
    big.mark = " ",
    trim = TRUE,
    decimal.mark = ",",
    scientific = FALSE
  )
}
