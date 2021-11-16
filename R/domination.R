.isPartition <- function(lambda){
  length(lambda) == 0L || all(floor(lambda) == lambda) && all(diff(lambda) <= 0)
}

.addZeros <- function(lambda){
  lambda <- lambda[seq_len(match(0L, lambda, nomatch = length(lambda) + 1L)-1L)]
  c(lambda, rep(0L, sum(lambda) - length(lambda)))
}

.removeZeros <- function(lambda){
  lambda[seq_len(match(0L, lambda, nomatch = length(lambda) + 1L)-1L)]
}


#' @title Domination order
#' @description Test whether a partition is dominated by another one.
#'
#' @param mu,lambda integer partitions
#'
#' @return A Boolean value, whether \code{mu} is dominated by \code{lambda}.
#' @export
#'
#' @name domination-order
#'
#' @examples c(2, 1, 1) %.<% c(3, 1)
isDominated <- function(mu, lambda){
  stopifnot(.isPartition(mu))
  stopifnot(.isPartition(lambda))
  if(sum(mu) != sum(lambda)){
    message(
      "The two partitions do not have the same weight, hence are not comparable."
    )
    return(FALSE)
  }
  lambda <- .addZeros(lambda)
  mu <- .removeZeros(mu)
  for(i in seq_along(mu)){
    if(sum(mu[1L:i]) > sum(lambda[1L:i])){
      return(FALSE)
    }
  }
  TRUE
}

#' @rdname domination-order
#' @export
dominates <- function(lambda, mu){
  isDominated(mu, lambda)
}

.equalPartitions <- function(lambda, mu){
  if(sum(lambda) != sum(mu)){
    return(FALSE)
  }
  lambda <- .removeZeros(lambda)
  mu <- .removeZeros(mu)
  if(length(lambda) != length(mu)){
    return(FALSE)
  }
  all(lambda == mu)
}

#' @rdname domination-order
#' @export
`%.<=%` <- function(mu, lambda){
  isDominated(mu, lambda)
}

#' @rdname domination-order
#' @export
`%.<%` <- function(mu, lambda){
  !.equalPartitions(mu, lambda) && isDominated(mu, lambda)
}

#' @rdname domination-order
#' @export
`%.>=%` <- function(lambda, mu){
  isDominated(lambda, mu)
}

#' @rdname domination-order
#' @export
`%.>%` <- function(lambda, mu){
  !.equalPartitions(mu, lambda) && isDominated(lambda, mu)
}


#' @title Dominated and dominating partitions
#' @description Returns the partitions dominated by a given partition or
#'   dominating this partition.
#'
#' @param lambda an integer partition
#'
#' @return A set of integer partitions.
#' @export
#' @name dominated-partition
#'
#' @examples
#' dominatedPartitions(c(2, 1, 1))
#' dominatingPartitions(c(2, 1, 1))
dominatedPartitions <- function(lambda){
  stopifnot(.isPartition(lambda))
  allParts <- parts(sum(lambda))
  allParts[, apply(allParts, 2L, isDominated, lambda = lambda), drop = FALSE]
}

#' @rdname dominated-partition
#' @export
dominatingPartitions <- function(lambda){
  stopifnot(.isPartition(lambda))
  allParts <- parts(sum(lambda))
  allParts[, apply(allParts, 2L, dominates, mu = lambda), drop = FALSE]
}
