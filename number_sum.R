number_sum <- function(number_vec, ratio = 2){
  number_vec <- number_vec*ratio
  sum_vec <- sum(number_vec)
  return(sum_vec)
}