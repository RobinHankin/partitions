\name{summary.partition}
\alias{summary.partition}
\title{Provides a summary of a partition}
\description{
Provides a summary of an object of class \code{partition}: usually  the
first and last few partitions (columns)
}
\usage{
\S3method{summary}{partition}(object, ...)
}
\arguments{
  \item{object}{Partition}
  \item{\dots}{Further arguments; see details section below}
}
\details{
  The ellipsis arguments are used to pass how many columns at the start
  and the end of the matrix are selected; this defaults to 10.

  The function is designed to behave as expected: if there is an
  argument named \dQuote{\code{n}}, then this is used.  If there is no
  such argument, the first one is used.
}
\value{
  A summary object is a list, comprising three elements:
  
  \item{shortened}{Boolean, with \code{TRUE} meaning that the middle
    section of the matrix is omitted, and \code{FALSE} meaning that the
    entire matrix is returned because \code{n} is too big}
  \item{n}{Number of columns to return at the start and the end of the matrix}
  \item{out}{Matrix returned: just the first and last \code{n} columns
    (if \code{shortened} is \code{TRUE}), or the whole matrix if not}
}
\author{Robin K. S. Hankin}
\examples{
summary(parts(7))

summary(parts(11),3)

}
\keyword{math}
