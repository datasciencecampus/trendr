##' Extracts the trend and first derivative using a local linear model in state-space form and the Diffuse Kalman
##' Filter.
##'
##' @param df The data frame with a time series
##' @param value.colname The name of the column with the values of the series
##' @param time.colname The name of the column with the time values
##' @param output.save Whether the results should save locally or now (default is FALSE)
##' @param output.dir The directory for the output file, by default your working directory
##' @param output.file The file name for the output file, by default out.csv
##' @param output.plot Specify whether you want the output to be plotted using R's basic plotting
##' 
##' @author Sonia Mazzi and Michael Hodge
##' @examples
##'   #trendr(
##'     #df = randomData,
##'     #value.colname = 'count',
##'     #time.colname = 'time',
##'     #output.dir = 'C:\Users\User\Documents\',
##'     #output.file = 'out.csv',
##'     #output.plot = T)
##' @export
trendr <- function(df = randomData,
                     value.colname = "value",
                     time.colname = "date",
                     output.save = FALSE,
                     output.dir = "./",
                     output.file = "out.csv",
                     output.plot = FALSE) {
  

  `%>%` <- magrittr::`%>%`
  
  # Suppress readr read_csv message 
  options(readr.num_columns = 0)
  
  earliest_timeseries_value <- get('df')[time.colname][[1]][1]
  latest_timeseries_value <- get('df')[time.colname][[1]][nrow(df)]
  
  y <- get('df')[value.colname][[1]]
  time <- get('df')[time.colname][[1]]
  
  #Hyperparameter estimation
  x0 <- c(1,1,1)

  min_out_values <- nlminb(start = x0, likelihoodLLMvard, y = y,
                           lower = c(-Inf, -Inf, 0.75), 
                           upper = c(0.5, 0.5, 1))$par
  
  # Diffuse Kalman Filter
  dkf_out_values <- dfkLLMvard(min_out_values, y)
  
  # The smoothing stage
  sm_out_values <- smfilt(dkf_out_values)
  
  # Alpha is the predicted state vector
  alpha <- sm_out_values$alpha
  
  ll <- dkf_out_values$ll
  
  # Trend
  mu <- alpha[1,]
  
  # First derivative
  beta <- round(alpha[2,], 5)
  
  # Put data together in a data frame

  if (grepl('-', earliest_timeseries_value) == TRUE) {
    df_ <- dplyr::tibble(mu, beta, time) %>% 
      dplyr::mutate(timeseries = seq(as.Date(earliest_timeseries_value, format='%Y-%m-%d'), as.Date(latest_timeseries_value, format='%Y-%m-%d'), by='day')) %>% 
      dplyr::mutate(count = y)
  } else {
    df_ <- dplyr::tibble(mu, beta, time) %>% 
      dplyr::mutate(timeseries = time) %>% 
      dplyr::mutate(count = y)
  }
  
  # Tidy up dataframe
  df_calc <- df_ %>% 
    dplyr::select(trend = mu, first_derivative = beta, timeseries = timeseries)
  
  df_out <- cbind(df,df_calc)
  # Write to output directory
  if (output.save == TRUE) {
    write.csv(df_out, paste0(output.dir,output.file))
  }
  
  # Plot output
  if (output.plot ==  T) {
    
    timeseries <- df_out$timeseries

    values <- get('df_out')[value.colname][[1]]

    trend <- df_out$trend
    first_der <- df_out$first_derivative
    
    par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
    plot(timeseries, values, type="l", xlab=time.colname,
         ylab=value.colname, ylim=c(min(first_der), max(values)))
    lines(timeseries, trend, col='red')
    par(new = T)
    plot(timeseries, first_der, col='blue', type = "l", xaxt = "n", yaxt = "n",
              ylab = "", xlab = "")
    axis(side = 4)
    mtext("first derivative", side = 4, line = 3)
    legend("bottomright", c("raw", "trend", "first der"),
               col = c("black", "red", "blue"), lty = c(1,1,1), inset=c(0,1), xpd=TRUE, horiz=TRUE, bty="n")
    
  }
  
  return(df_out)
}
                     
                         