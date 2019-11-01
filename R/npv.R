npv <- function(cf_and_wacc, calculation_date = "2019-12-31"){
  calculation_date <- as.Date(calculation_date)
  net_present_value <- cf_and_wacc %>%
    dplyr::mutate(t = lubridate::interval(start = calculation_date, end = date)/lubridate::duration(1, units = "years")) %>%
    filter(t >= 0) %>% summarise(npv = sum(cashflow / ((1 + adjusted_wacc)^t)))
  return(net_present_value)
}




