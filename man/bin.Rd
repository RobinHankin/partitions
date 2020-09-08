\name{bin}
\alias{bin}
\alias{tobin}
\alias{todec}
\alias{comptobin}
\alias{bintocomp}
\title{Sundry binary functionality}
\description{
  Utilities to convert things to binary
}
\usage{
tobin(n, len, check=TRUE)
todec(bin)
comptobin(comp, check=TRUE)
bintocomp(bin,  use.C=TRUE, check=TRUE)
}
\arguments{
  \item{n}{Integer, to be converted to binary by function \code{tobin()}}
  \item{len}{Length of the binary vector returned by function
    \code{tobin()}}
  \item{bin}{Binary: a vector of \code{0}s and \code{1}s}
  \item{comp}{A composition}
  \item{check}{Boolean, with default \code{TRUE} meaning to perform
    various checks}
  \item{use.C}{Boolean, with default \code{TRUE} meaning to use
    \code{C}}
}
\details{
  These functions are not really intended for the end user; they are
  used in \code{nextcomposition()}.
  \itemize{
    \item Function \code{tobin()} converts integer \code{n} to a binary
    string of length \code{len}
    \item Function \code{todec()} converts a binary string to decimal,
    so \code{todec(tobin(n,i))==n}, provided \code{i} is big enough
    \item Function \code{comptobin()} converts a composition to binary
    \item Function \code{bintocomp()} converts a binary string to a
    composition
  }
}
\author{Robin K. S. Hankin}
\references{
Wikipedia contributors, 2020. \dQuote{Composition (combinatorics) --- Wikipedia, The Free Encyclopedia},
\url{https://en.wikipedia.org/w/index.php?title=Composition_(combinatorics)&oldid=944285378}
}
\examples{
tobin(10,5)
todec(tobin(10,5))
comptobin(c(1,1,4))
bintocomp(c(1,1,0,0,1,1,1,1))
}


  
  
  
