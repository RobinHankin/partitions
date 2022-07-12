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
allriffles(n,r=2)
}
\arguments{
  \item{p,q,v}{In function \code{riffle()}, integers \code{p},\code{q}
    specify the length of the two increasing sequences.  In function
    \code{genrif()}, the elements of \code{v} specify the lengths of all
    the increasing sequences}
  \item{n,r}{In function \code{allriffles()}, integer \code{n} specifies
    the size of the pack and \code{r} specifies the number of increasing
    sequences}
}
\details{

  A \dfn{riffle shuffle} is a permutation of integers
  \mjeqn{1,2,\ldots,n}{1,2,...,n} containing one or two rising
  sequences.

  A \dfn{generalized riffle shuffle}, or \dfn{\mjseqn{r}-riffle
  shuffle}, contains \mjseqn{r} rising sequences.
\itemize{
  \item\code{riffle(p,q)} returns a riffle shuffle of rising sequence
  \code{1:p} and \code{(p+1):q}

  \item\code{genrif(v)} returns a riffle shuffle of rising sequences
  with lengths the entries of \code{v}
  \item\code{allriffles(n,v)} returns
  all \mjseqn{r}-riffle shuffles of size \mjseqn{n}
}
}
\value{
  Returns a matrix of class \code{partition} with columns being 
  riffle shuffles
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{parts}}}
\runExamples{
riffle(3,4)
allriffles(4)
genrif(1:3)
}

