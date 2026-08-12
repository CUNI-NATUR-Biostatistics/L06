format_whole_number <- function(number) {
  res_formatted_number <-
    format(
      x = round(x = number),
      big.mark = " ",
      scientific = FALSE,
      trim = TRUE
    )

  return(res_formatted_number)
}