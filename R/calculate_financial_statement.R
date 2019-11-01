calculate_income <- function(yearly_production, price_path){
  income <- price_path %>%
    dplyr::mutate(estimated_income = yearly_production * price_path$power_price)
  return(income)
}


calculate_cost <- function(yearly_production, price_path,
                           operating_cost_kwh = 0.3, investment_kwh = 0.2,
                           depreciation_kwh = 0.2){
  cost <- price_path %>% dplyr::select(date) %>%
    dplyr::mutate(operating_cost = operating_cost_kwh * yearly_production,
                  investments = investment_kwh * yearly_production,
                  depreciation = depreciation_kwh * yearly_production)
  return(cost)
}


calculate_financials <- function(calculated_income, calculated_cost){
  financials <- dplyr::left_join(calculated_income, calculated_cost, by = "date")
  return(financials)
}



