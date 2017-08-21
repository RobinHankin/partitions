\name{perms}
\alias{perms}
\alias{plainperms}
\title{Enumerate the permutations of a vector}
\description{
  Given an integer \code{n}, return a matrix whose columns enumerate various
  permutations of \code{1:n}.

  Function \code{perms()} returns all permutations in lexicographic
  order; function \code{plainperms()} returns all permutations by
  repeatedly exchanging adjacent pairs.
}

\usage{
perms(n)
plainperms(n)
}
\arguments{
  \item{n}{Integer argument; permutations of \code{1:n} returned}
}
\author{D. E. Knuth; \code{C} and \R transliteration by Robin K. S. Hankin}
\note{
  Comments in the \code{C} code; algorithm lifted from
  \file{fasc2b.pdf}.
}
\seealso{\code{\link{parts}}}
\references{
  \itemize{
    \item D. E. Knuth 2004.  \dQuote{The art of computer programming,
      pre-fascicle 2B.  A draft of section 7.2.1.2: Generating all
      permutations}.  \url{http://www-cs-faculty.stanford.edu/~knuth/taocp.html}}
}
\examples{
summary(perms(5))

# Knuth's Figure 18:
matplot(t(apply(plainperms(4),2,order)),
        type='l', lty=1, lwd=5, asp=1,
        frame=FALSE, axes=FALSE, ylab="", col=gray((1:5)/5))



}
\keyword{math}
