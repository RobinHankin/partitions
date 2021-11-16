\name{domination-order}
\alias{domination-order}
\alias{isDominated}
\alias{dominates}
\alias{\%.<=\%}
\alias{\%.<\%}
\alias{\%.>=\%}
\alias{\%.>\%}
\title{Domination order}
\usage{
isDominated(mu, lambda)

dominates(lambda, mu)

mu \%.<=\% lambda

mu \%.<\% lambda

lambda \%.>=\% mu

lambda \%.>\% mu
}
\arguments{
\item{mu, lambda}{integer partitions}
}
\value{
A Boolean value, whether \code{mu} is dominated by \code{lambda}.
}
\description{
Test whether a partition is dominated by another one.
}
\examples{
c(2, 1, 1) \%.<\% c(3, 1)
}
