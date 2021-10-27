convert_temperature <- function(temperature_vector){
  
  celcius <- (temperature_vector - 32) * (5/9) 
  kelvin <- celcius + 273.15 
  
  tibble("fahrenheit" = temperature_vector,
         "celcius" = celcius,
         "kelvin" = kelvin) 
  
}