get_power_data <- function(){
  power_data <- jsonlite::fromJSON("https://www.nve.no/umbraco/api/Powerplant/GetHydroPowerPlantsInOperation")
  return(power_data)
}


return_power_data <- function(power_data){
  power_data <- power_data %>% dplyr::mutate(power_prod = MidProd_81_10 * 10^6) %>% dplyr::select(Navn, power_prod)
  return(power_data)
}

