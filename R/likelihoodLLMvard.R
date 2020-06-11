##' This the function computes the likelihood for the locally linear state space model with a time varying drift (second component of alpha)
##'
##' @param x Values of a vector of hyperparameters
##' @param y Vector with the values of the time series
##' 
##' @author Sonia Mazzi
##' @export
likelihoodLLMvard <- function(x, y){ 
  sigma.eps <- 1
  sigma.gnu <- x[1]
  sigma.eta <- x[2]
  delta <- x[3]
  ll <- length(y)
  aux <- c(1, 1, 0, delta)
  TT <- matrix(aux, 2, 2, byrow = T)
  lTT = nrow(TT)
  A <- cbind(diag(-1, lTT), rep(0, lTT))
  ncA0 <- ncol(A)
  QQ <- matrix(0, ncA0, ncA0)
  DD <- rep(0, ll)
  elem <- c((sigma.gnu^2), 0, 0, (sigma.eta^2))
  HHt <- matrix(elem, lTT, lTT, byrow = T)
  GGt <- sigma.eps^2
  P0 <- matrix(0, lTT, lTT)
  P <- P0
  Z <- matrix(c(1, 0), 1, lTT) 
  #
  for (i in 1:ll){ 
    aux2 <- matrix(c(rep(0, (ncA0-1)), y[i]), 1, ncA0)
    E <- aux2 - Z %*% A
    D <- Z %*% P %*% t(Z) + GGt
    DD[i] <- D
    Dinv <- 1/D
    K <- TT %*% P %*% t(Z) %*% Dinv
    A <- TT %*% A + K %*% E
    L <- TT - K %*% Z
    P <- L %*% P %*% t(TT) + HHt
    QQ <- QQ + t(E) %*% Dinv %*% E
    }
  #
  SS <- QQ[(1:lTT), (1:lTT)]
  qqq <- as.matrix(QQ[((lTT + 1) : ncA0), ((lTT + 1) : ncA0)])
  ss <- QQ[(1 : lTT), ((lTT + 1) : ncA0)]
  Sinv <- solve(SS)
  gamma.est <- Sinv %*% ss
  sigma2.est <- (qqq - t(ss) %*% Sinv %*% ss) / ll
  sigma2.est <- as.numeric(sigma2.est)
  sigmatilde2 <- (ll / (ll - ncA0 + 1)) * sigma2.est
  loglik <- (-0.5) * ((ll - ncA0 + 1) * (1 + log(sigmatilde2)) + sum(log(abs(DD))))
  -loglik
  }
