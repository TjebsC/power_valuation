equity_beta <- function(cashflows, asset_beta = 0.6, debt_share = 0.5){
  e_beta <- cashflows %>%
    dplyr::mutate(equity_beta = (1 + (debt_share/(1 - debt_share))) * asset_beta)
  return(e_beta)
}

cost_of_equity <- function(equity_beta_cf, rf = 0.02, other_adjustments = 0.02, mrp = 0.05){
 cost_e <- equity_beta_cf %>%
   dplyr::mutate(cost_of_equity = rf + other_adjustments + (mrp * equity_beta))
 return(cost_e)

}

cost_of_debt <- function(cashflows, rf = 0.02, debt_premium = 0.025, corp_income_tax = 0.22){
 cost_d <- cashflows %>%
   dplyr::mutate(cost_of_debt = (rf + debt_premium) * (1 - corp_income_tax))
 return(cost_d)
}

cost_of_capital <- function(cashflows_w_costs, debt_share = 0.5){
  unadj_wacc <- cashflows_w_costs %>%
    dplyr::mutate(unadjusted_wacc = (cost_of_equity * (1 - debt_share)) + (cost_of_debt * debt_share))
  return(unadj_wacc)
}


adj_cost_of_capital <- function(cashflows_w_cost_of_capital, inflation = 0.02){
  adj_wacc <- cashflows_w_cost_of_capital %>%
    dplyr::mutate(adjusted_wacc = ((1 + unadjusted_wacc) / (1 + inflation)) - 1)
  return(adj_wacc)
}


calculate_capital_cost <- function(cashflows, asset_beta = 0.6, debt_share = 0.5, rf = 0.02,
                                      mrp = 0.05, inflation = 0.02, equity_adjustments = 0.02,
                                      debt_premium = 0.025, corp_income_tax = 0.22){

  capital_cost <- cashflows %>%
    equity_beta(asset_beta = asset_beta, debt_share = debt_share) %>%
    cost_of_equity(rf = rf, other_adjustments = equity_adjustments, mrp = mrp) %>%
    cost_of_debt(rf = rf, debt_premium = debt_premium, corp_income_tax = corp_income_tax) %>%
    cost_of_capital(debt_share = debt_share) %>%
    adj_cost_of_capital(inflation = inflation)

  return(capital_cost)

}



