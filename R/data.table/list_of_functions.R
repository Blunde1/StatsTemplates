#' Apply a list of functions to multiply columns in a data.table by a given group
#' @param x numeric vector 
#' @return list  

list_func = function(x) {
  
  # List functions 
  res = list(mean = mean(x),
             sd = sd(x))
  
  return(res)
}

library(data.table)
dt = data.table(x = rnorm(100), y = rnorm(100, 10, 2), fac = factor(sample(letters[1:3], 100, replace = TRUE)))

dt[, unlist(lapply(.SD, list_func), recursive = FALSE), fac, .SDcols = c("x", "y")]

# lapply returns a list for each variable in SD. 
# If we do not unlist it they will get stacked on top of each other: 
dt[, lapply(.SD, list_func), .SDcols = c("x", "y")]

