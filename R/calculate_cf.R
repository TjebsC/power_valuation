calculate_cf <- function(financial_statement, tax_rate = 0.22){
  cf <- financial_statement %>% dplyr::mutate(tax = tax_rate * (estimated_income - operating_cost),
                                               cashflow = estimated_income - operating_cost - tax - investments + depreciation)
  return(cf)
}


