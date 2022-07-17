\name{riffle}
\alias{riffle}
\alias{genrif}
\alias{allriffles}
\title{Riffle shuffles}
\description{\loadmathjax
  Enumeration of riffle shuffles
}
\usage{
genrif(v)
riffle(p,q=p)
}
\arguments{
  \item{p,q,v}{In function \code{riffle()}, integers \code{p},\code{q}
    specify the length of the two increasing sequences.  In function
    \code{genrif()}, the elements of \code{v} specify the lengths of all
    the increasing sequences: there are \code{sum(v)} cards in the pack}
}
\details{

  A \dfn{riffle shuffle} is a permutation of integers
  \mjeqn{1,2,\ldots,n}{1,2,...,n} containing one or two rising
  sequences.
  
  A \dfn{generalized riffle shuffle}, or \dfn{\mjseqn{r}-riffle
    shuffle}, contains at most \mjseqn{r} rising sequences.  This is not
    implemented in the package (earlier versions included a buggy
    version; the difficulty is ensuring that sequences do not appear
    more than once).
  
  \itemize{
    \item\code{riffle(p,q)} returns all riffle shuffles with rising
    sequences of \code{1:p} and \code{(p+1):q}
    \item\code{genrif(v)} returns all riffle shuffles with rising
    sequences having lengths the entries of \code{v}, the deck being
    numbered consecutively
  }
}
\value{
  Returns a matrix of class \code{partition} with columns being 
  riffle shuffles
}
\note{
  When we say \dQuote{contains \mjseqn{r} rising sequences} we generally
  mean \dQuote{contains \emph{at most} \mjseqn{r} rising sequences}
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{parts}}}
\runExamples{
riffle(3,4)
genrif(1:3)
}

