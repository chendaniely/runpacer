parse_distance_text <- function(distance_string) {
  #browser()
  distrance_string_clean <- distance_string |>
    stringr::str_remove_all("\\s") |>
    stringr::str_to_lower()

  number = NULL
  unit = NULL

  number = stringr::str_extract(distrance_string_clean, "\\d*") |>
    as.numeric()
  unit = stringr::str_extract(distrance_string_clean, "[a-z]+")

  # convert meters to km
  if (unit == "m") {
    unit = "km"
    number = number / 1000
  } else if (unit == "half") {
    unit = "km"
    number = 21.1
  } else if (unit == "marathon") {
    unit = "mi"
    number = 26.2
  }

  distance_unit <- list(
    distance = number,
    unit = unit
  )
  class(distance_unit) <- "distance_unit"
  return(distance_unit)
}

expected <- list(distance = 0.4, unit = "km")
class(expected) <- "distance_unit"
testthat::expect_equal(parse_distance_text("   400 m   "), expected)

expected <- list(distance = 10, unit = "km")
class(expected) <- "distance_unit"
testthat::expect_equal(parse_distance_text("   10 km   "), expected)
