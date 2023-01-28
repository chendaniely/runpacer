library(lubridate)

m2k <- function(miles) {
  return(miles * 1.60934)
}

testthat::expect_equal(round(m2k(3.1)), 5)

k2m <- function(km) {
  return(km * 0.621371)
}

testthat::expect_equal(round(k2m(10), 1), 6.2)


km_mile_distrances <- function(distance, unit) {
  if (unit == "mi") {
    distrance_mi <- distance
    distrance_km <- m2k(distance)
  } else {
    distrance_mi <- k2m(distance)
    distrance_km <- distance
  }
  km_mile_dist <- list(
    km = distrance_km,
    mi = distrance_mi
  )
  class(km_mile_dist) <- "km_mile"

  return(km_mile_dist)
}

expected <- list(km = 10, mi = k2m(10))
class(expected) <- "km_mile"
testthat::expect_equal(km_mile_distrances(10, "km"), expected)



mile_pace_to_distance_mi <- function(mile_pace, distance) {

}

mile_paces <- c(

)

