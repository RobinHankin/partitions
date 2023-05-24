\name{condense}
\alias{condense}
\title{Condensed form for partitions}
\description{
Given a partition, coerce to a nice character format
}
\usage{
condense(x, minval=1, col)
}
\arguments{
  \item{x}{A partition or a matrix whose columns are partitions}
  \item{minval}{Minimum value to include in the printing, defaulting to
    1 [meaning to ignore zero values].  Set to \dQuote{0} for compositions}
  \item{col}{String specifying the collapse value with missing value
    meaning to use the empty string if values are all single digit, and
    a comma if not}
}
\details{
Experimental: caveat emptor!
}
\author{Robin K. S. Hankin}
\examples{

condense(parts(9))
condense(compositions(9,3),0)
condense(diffparts(17))

}
\keyword{math}
