# Data generation
generate_data <- function(type = "L0_unif", positivity_parameter, alpha0, beta0, beta1, beta2, n, 
                          alpha1 = 0, alpha2 = 0, beta3 = 0){
  if(type == "L0_unif"){
    L0 <- runif(n, min= -positivity_parameter, max= positivity_parameter)
  }else{
    L0 <- rexp(n, rate = 1 / positivity_parameter) * (1 - 2 * rbinom(n, 1, prob = 0.5))
  }
  g00 <- expit(alpha0 * L0 + alpha1 * L0^2 + alpha2 * L0^3)
  A0 <- rbinom(n, 1, g00)
  PL1givenA0L0 <- expit(beta0 + beta1 * A0 + beta2 * L0 + beta3 * L0^2)
  L1 <- rbinom(n, 1, PL1givenA0L0)
  list(L0 = L0, A0 = A0, L1 = L1)
}