format_whole_number_for_math <- function(number) {
  vec_number_parts <-
    strsplit(
      x = format_whole_number(number = number),
      split = " ",
      fixed = TRUE
    )[[1]]

  res_formatted_number <-
    paste(
      vec_number_parts,
      collapse = "\\,"
    )

  return(res_formatted_number)
}