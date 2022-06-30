\name{conjugate}
\alias{conjugate}
\alias{durfee}
\alias{durfee_sorted}
\alias{Durfee}
\title{Conjugate partitions and Durfee squares}
\description{
Given a partition, provide its conjugate or Durfee square
}
\usage{
conjugate(x, sorted = TRUE)
durfee(x, sorted = TRUE)
durfee_sorted(x)
}
\arguments{
  \item{x}{Either a vector describing a partition or a matrix whose
    columns are partitions}
  \item{sorted}{A logical indicating whether the data is already in
    standard form.  That is to say, are the data within each column
    sorted in decreasing order?}
}
\details{
  Conjugation is described in Andrews, and (e.g.) Hardy and Wright.

  The \dfn{conjugate} of a partition may be calculated by taking its
  Ferrers diagram and considering the partition defined by columns
  instead of rows.  This may be visualised by flipping the Ferrers
  diagram about the leading diagonal.

  Essentially, \code{conjugate()} carries out \R idiom

  \code{rev(cumsum(table(factor(a[a>0],levels=max(a):1))))}

  but is faster.

  The \dQuote{Durfee square} of a partition is defined on page 281 of
  Hardy and Wright.  It is the largest square of nodes contained in the
  partition's Ferrers graph.  Function \code{durfee()} returns the
  length of the side
  of the Durfee square, which Andrews denotes
  \eqn{d(\lambda)}{d(lambda)}.  It is equivalent to \R idiom

  \code{function(a){sum(a>=1:length(a))}}

  but is faster.

}
\value{
Returns either a partition in standard form, or a matrix whose
columns are partitions in standard form.
}
\author{Robin K. S. Hankin}
\note{
If argument \code{x} is not non-increasing, you must use the
\code{sorted = FALSE} flag. Otherwise, these functions will not work and will
silently return garbage.  Caveat emptor!  (output from \code{blockparts()}
is not necessarily non-increasing)
}
\examples{
parts(5)
conjugate(parts(5))

restrictedparts(6,4)
conjugate(restrictedparts(6,4))

durfee(10:1)

# A partition in nonstandard form --- use `sorted = FALSE`
x <- parts(5)[sample(5),]
durfee(x, sorted = FALSE)
conjugate(x, sorted = FALSE)

# Suppose one wanted partitions of 8 with no part larger than 3:

conjugate(restrictedparts(8,3))

# (restrictedparts(8,3) splits 8 into at most 3 parts;
# so no part of the conjugate partition is larger than 3).
}
\keyword{math}
