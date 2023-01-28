source("R/conversions.R")

REFERENCE_DISTANCES <- c(
  "400m",
  "1km",
  "1mi",
  "5km",
  "8km",
  "10km",
  "10mi",
  "half",
  "marathon",
  "50km",
  "50mi",
  "100km",
  "100mi"
)


distance_unit <- parse_distance_text("10km")
distance_unit


km_mile <- km_mile_distrances(distance_unit$distance, distance_unit$unit)
km_mile

pace_times <- function(time, input_dist_unit, output_dist_unit) {
  input_distance_unit_parsed <- parse_distance_text(input_dist_unit)
  input_distance <- input_distance_unit_parsed$distance
  input_unit <- input_distance_unit_parsed$unit

  num_colons <- stringr::str_count(time, ":")

  if (num_colons == 1) {
    seconds <- lubridate::period_to_seconds(lubridate::ms(time))
  } else if (num_colons == 2) {
    seconds <- lubridate::period_to_seconds(lubridate::hms(time))
  } else {
    stop("Time input error, unknown number of colons, :")
  }
  print(glue::glue("Total number of seconds: {seconds}"))

  km_mile_input <- km_mile_distrances(input_distance, input_unit)
  output_parsed <- output_dist_unit |>
    parse_distance_text()
  km_mile_output <- km_mile_distrances(output_parsed$distance, output_parsed$unit)

  x = seconds / km_mile_input$km * km_mile_output$km

  td <- seconds_to_period(x)
  # TODO: fix the output
  sprintf('%02f:%02f:%02f', td@hour, minute(td), second(td))
}




pace_times("23:31", "5km", "1mi")
pace_times("23:4", "5km", "1mi")
pace_times("26:23:4", "5km", "1mi")
pace_times("1:53:02", "half", "1mi")

