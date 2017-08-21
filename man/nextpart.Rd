\name{nextpart}
\alias{nextpart}
\alias{islastpart}
\alias{firstpart}
\alias{nextdiffpart}
\alias{islastdiffpart}
\alias{firstdiffpart}
\alias{nextrestrictedpart}
\alias{islastrestrictedpart}
\alias{firstrestrictedpart}
\alias{nextblockpart}
\alias{islastblockpart}
\alias{firstblockpart}
\alias{nextcomposition}
\alias{islastcomposition}
\alias{firstcomposition}
\title{Next partition}
\description{
  Given a partition, return the \dQuote{next} one; or determine whether
  it is the last one.
}
\usage{
  nextpart(part, check=TRUE)
islastpart(part)
 firstpart(n)
  nextdiffpart(part, check=TRUE)
islastdiffpart(part)
 firstdiffpart(n)
  nextrestrictedpart(part, check=TRUE)
islastrestrictedpart(part)
 firstrestrictedpart(n, m, include.zero=TRUE)
  nextblockpart(part, f, n=sum(part), include.fewer=FALSE, check=TRUE)
islastblockpart(part, f, n=NULL     , include.fewer=FALSE)
 firstblockpart(      f, n=NULL     , include.fewer=FALSE)
  nextcomposition(comp, restricted, include.zero=TRUE, check=TRUE)
islastcomposition(comp, restricted, include.zero=TRUE)
 firstcomposition(n,    m=NULL    , include.zero=TRUE)
}
\arguments{
  \item{part,comp}{A partition or composition}
    \item{check}{Boolean, with default \code{TRUE} meaning to carry out
    various safety checks; the \code{next()} functions use \code{C}
    calls which might crash the session with some inputs}
  \item{f, n, include.fewer, m, include.zero}{Other arguments as per the
    vectorized version}
  \item{restricted}{In function \code{nextcomposition()} and
    \code{islastcomposition()}, Boolean, with \code{TRUE} meaning to
    consider compositions of fixed length [eg, to iterate through the
    columns of \code{compositions(6,3)}],  and
    \code{FALSE} meaning to consider compositions of any length [eg to
    iterate through the columns of \code{compositions(6)}]}
}
\details{
These functions are intended to enumerate partitions one at a time,
eliminating the need to store a huge matrix.  This is useful for
optimization over large domains and makes it possible to investigate
larger partitions than is possible with the vectorized codes.

The idea is to use a \code{first...()} function to generate the first
partition, then iterate using a \code{next...()} function, stopping when
the \code{islast...()} function returns \code{TRUE}.

An example is given below, in which the \dQuote{scrabble} problem is
solved;  note the small size of the sample space.   More examples are
given in the \code{tests/aab.R} file.
}
\note{
  Functions \code{nextpart()} and \code{nextdiffpart()} require a vector
  of the right length: they require and return a partition padded with
  zeros.  Functions \code{nextrestrictedpart()} and
  \code{nextblockpart()} work with partitions of the specified length.
  Function \code{nextcomposition()} truncates any zeros at the end of
  the composition.  This behaviour is inherited from the \code{C} code.
  
  In functions \code{nextcomposition()} and \code{firstcomposition()},
  argument \code{include.zero} is ignored if \code{restricted} is
  \code{FALSE}.

  I must say that the performance of these functions is terrible;
  they are much much slower than their vectorized equivalents.  The
  magnitude of the difference is much larger than I expected.  Heigh
  ho.  Frankly you would better off working directly in \code{C}.
  }
\author{Robin K. S. Hankin}
\seealso{\code{\link{parts}}}
\examples{

# Do the optimization in scrabble vignette, one partition at a time:
# (but with a smaller letter bag)
scrabble <- c(a=9 , b=2 , c=2 , d=4 , e=12 , f=2 , g=3)

f <- function(a){prod(choose(scrabble,a))/choose(sum(scrabble),7)}
bestsofar <- 0
a <- firstblockpart(scrabble,7)
while(!islastpart(a)){
  jj <- f(a)
  if(jj>bestsofar){
    bestsofar <- jj
    bestpart <- a
  }
  a <- nextblockpart(a,scrabble) 
}


}
\keyword{math}
