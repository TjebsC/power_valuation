get_power_prices <- function() {
  power_price <-
    tibble::tibble(
      date = seq(
        lubridate::as_date("2019-12-31"),
        lubridate::as_date("2099-12-31"),
        by = "year"),
      power_price = c(
        0.30,
        0.32,
        0.35,
        0.37,
        0.38,
        0.40,
        0.41,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        0.43,
        rep(0.43, 59)
      )
    )
  usethis::use_data(power_price, overwrite = T)
}
