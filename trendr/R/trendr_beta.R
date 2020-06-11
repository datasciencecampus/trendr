##' Calculates the first derivative using a local linear model 
##'
##' Calculates the trend and first derivative using a local linear model. Also uses a Kalman
##' Filter.
##'
##' @param y the values
##' 
##' @author Michael Hodge
##' @export
trendr_beta <- function(y) {
  
  time <- seq(1,length(y))
  
  # Suppress readr read_csv message 
  options(readr.num_columns = 0)
  
  earliest_timeseries_value <- time[1]
  latest_timeseries_value <- time[length(time)]
 
  #Hyperparameter estimation
  x0 <- c(1,1,1,1)

  min_out_values <- nlminb(start = x0, likelihoodLLMvard, y = y,
                           lower = c(-Inf, -Inf, 0.85, -Inf), 
                           upper = c(0.5, 0.5, 1, 0.5))$par
  
  # Diffuse Kalman Filter
  dkf_out_values <- dfkLLMvard(min_out_values, y)
  
  # The smoothing stage
  sm_out_values <- smfilt(dkf_out_values)
  
  # Alpha is the predicted state vector
  alpha <- sm_out_values$alpha
  
  beta <- alpha[2,]

  return(beta)
}
                     
                         