\name{partitions-package}
\alias{partitions-package}
\alias{partitions}
\docType{package}
\title{
Integer partitions
}
\description{
Routines to enumerate all partitions of an integer; includes restricted
and unequal partitions.
}
\details{

This package comprises eight functions: \code{P()}, \code{Q()},
\code{R()}, and \code{S()} give the number of partitions, unequal
partitions, restricted partitions, and block partitions of an integer.

Functions \code{parts()}, \code{diffparts()}, \code{restrictedparts()},
and \code{blockparts()} enumerate these partitions.

Function \code{conjugate()} gives the conjugate of a partition and
function \code{durfee()} gives the size of the Durfee square.  

\strong{NB} the emphasis in this package is terse, efficient C code.
This means that there is a minimum of argument checking.  For example,
function \code{conjugate()} assumes that the partition is in standard
form (i.e. nonincreasing); supplying a vector in nonstandard form will
result in garbage being returned silently.  Note that a block partition
is not necessarily in standard form.
}
\author{Robin K. S. Hankin}
\references{
  \itemize{
    \item G. E. Andrews 1998 \emph{The Theory of Partitions},
      Cambridge University Press
    \item M. Abramowitz and I. A. Stegun 1965.  \emph{Handbook of
      Mathematical Functions}, New York: Dover
    \item G. H. Hardy and E. M. Wright 1985 \emph{An introduction to
      the theory of numbers}, Clarendon Press: Oxford (fifth edition)
    \item R. K. S. Hankin 2006.  \dQuote{Additive integer partitions in
      \R}. \emph{Journal of Statistical Software}, Volume 16, code
    snippet 1 
    \item R. K. S. Hankin 2007.  \dQuote{Urn sampling without
      replacement: enumerative combinatorics in \R}. \emph{Journal of
      Statistical Software}, Volume 17, code snippet 1
    \item R. K. S. Hankin 2007.  \dQuote{Set partitions in
      \R}. \emph{Journal of Statistical Software}, Volume
    23, code snippet 2
  }
}
\keyword{package}
\examples{
 parts(5)
 diffparts(9)
 restrictedparts(15,10)
 P(10,give=TRUE)
 Q(10,give=TRUE)
 R(5,10)
}
