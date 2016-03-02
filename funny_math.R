funny_math <- function(samp_vec, ratio = 2, operator) {
  if (operator == "add"){
    return(sum(samp_vec + ratio))
  } else if (operator == "subtract"){
    return(sum(samp_vec - ratio))
  }
}