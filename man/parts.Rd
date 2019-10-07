\name{parts}
\alias{parts}
\alias{diffparts}
\alias{restrictedparts}
\alias{blockparts}
\alias{compositions}
\alias{multiset}
\alias{mset}
\alias{c_allblockparts}
\alias{c_alldiffparts}
\alias{c_allparts}
\alias{c_allperms}
\alias{c_allrestrictedparts}
\alias{c_bintocomp}
\alias{c_comptobin}
\alias{c_conjugate}
\alias{c_durfee}
\alias{c_nextblockpart}
\alias{c_nextdiffpart}
\alias{c_nextpart}
\alias{c_nextrestrictedpart}
\alias{c_plainperms}
\alias{c_multiset}
\alias{c_tobin}
\alias{c_wrap}
\alias{c_numbdiffparts}
\alias{c_numbparts}
\alias{numbrestrictedparts_R}
\title{Enumerate the partitions of an integer}
\description{
  Given an integer, return a matrix whose columns enumerate various
  partitions.

  Function \code{parts()} returns the unrestricted partitions; function
  \code{diffparts()} returns the unequal partitions; function
  \code{restrictedparts()} returns the restricted partitions; function
  \code{blockparts()} returns the partitions subject to specified
  maxima; and function \code{compositions()} returns all compositions
  of the argument.
  }

\usage{
parts(n)
diffparts(n)
restrictedparts(n, m, include.zero=TRUE, decreasing=TRUE)
blockparts(f, n=NULL, include.fewer=FALSE)
compositions(n, m=NULL, include.zero=TRUE)
multiset(v,n=length(v))
mset(v)
}
\arguments{
  \item{n}{Integer to be partitioned.  In function \code{blockparts()},
    the default of \code{NULL} means to return all partitions of any size}
  \item{m}{In functions \code{restrictedparts()} and
    \code{compositions()}, the order of the partition}
  \item{include.zero}{In functions \code{restrictedparts()} and
    \code{compositions()}, Boolean with default \code{FALSE} meaning to
    include only partitions of \eqn{n} into \emph{exactly} \eqn{m}
    parts; and \code{TRUE} meaning to include partitions of \eqn{n} into
    \emph{at most} \eqn{m} parts (because zero parts are included)}
  \item{include.fewer}{In function \code{blockparts()}, Boolean with
    default \code{FALSE} meaning to return vectors whose sum is
    \emph{exactly} \code{n} and \code{TRUE} meaning to return partitions
    whose sum is \emph{at most} \code{n}}
  \item{decreasing}{In \code{restrictedparts()}, Boolean with default
    \code{TRUE} meaning to return partitions whose parts are in
    decreasing order and \code{FALSE} meaning to return partitions in
    lexicographical order, as appearing in Hindenburg's
    algorithm.   Note that setting to \code{decreasing} to \code{FALSE}
    has the effect of making \code{conjugate()} return garbage}
  \item{f}{In function \code{blockparts()}, a vector of strictly
    positive integers that gives the maximal number of blocks; see
    details}
  \item{v}{In function \code{multiset()}, an integer vector representing
    a multiset.  Argument \code{n} is the size of the sample to be taken}
}
\details{
  \itemize{
    \item Function \code{parts()} uses the algorithm in Andrews.
    Function \code{diffparts()} uses a very similar algorithm that I
    have not seen elsewhere.  These functions behave strangely if given
    an argument of zero.
    
    \item Function \code{restrictedparts()} uses the algorithm in
    Andrews, originally due to Hindenburg.  For partitions into at most
    \eqn{m} parts, the same Hindenburg's algorithm is used but with a
    start vector of \code{c(rep(0,m-1),n)}.

    If \eqn{m>n}, the partitions are padded with zeros.

    \item Function \code{blockparts()} enumerates the compositions of an
    integer subject to a maximum criterion: given vector
    \eqn{y=(y_1,\ldots,y_n)}{y=(y_1,...,y_p)} all sets of
    \eqn{a=(a_1,\ldots,a_n)}{a=(a_1,...,a_p)} satisfying
    \eqn{\sum_{i=1}^pa_i=n}{sum(a_i)=n} subject to \eqn{0\leq a_i\leq
    y_i}{0 <= a_i <= y_i} for all \eqn{i} are given in lexicographical
    order.  If argument \code{y} includes zero elements, these are
    treated consistently (ie a position with zero capacity).

    If \code{n} takes its default value of \code{NULL}, then the
    restriction \eqn{\sum_{i=1}^pa_i=n}{sum(a_i)=n} is relaxed (so that
    the numbers may sum to anything).  Note that these solutions are not
    necessarily in standard form, so functions \code{durfee()} and
    \code{conjugate()} may fail.

    \item With a single argument, \code{compositions(n)} returns
    all \eqn{2^{n-1}}{2^(n-1)} ways of partitioning an integer; thus
    \code{4+1+1} is distinct from \code{1+4+1} or \code{1+1+4}.

    With two arguments, \code{compositions(n,m)} returns all
    nonnegative solutions to \eqn{x_1+\cdots+x_m=n}{x_1+...+x_m=n}.

    This function is different from all the others in the package in
    that it is written in \R; it is not clear that C would be any
    faster.

    \item Function \code{multiset()} returns all ways of ordering a
    multiset (\code{mset()} is a low-level helper function).
  }
}
\author{Robin K. S. Hankin}
\note{
  These vectorized functions return a matrix whose columns are the
  partitions.  If this matrix is too large, consider enumerating the
  partitions individually using the functionality documented in
  \code{nextpart.Rd}.

  One commonly encountered idiom is \code{blockparts(rep(n,n),n)}, which
  is equivalent to \code{compositions(n,n)} [Sloane's \code{A001700}].
}
\seealso{\code{\link{nextpart}}}
\references{
  \itemize{
    \item G. E. Andrews. \dQuote{The theory of partitions},
      Cambridge University Press, 1998
    \item R. K. S. Hankin 2006.  \dQuote{Additive integer partitions in
      \R}. \emph{Journal of Statistical Software}, Volume 16, code
      snippet 1 
    \item R. K. S. Hankin 2007.  \dQuote{Urn sampling without
      replacement: enumerative combinatorics in \R}. \emph{Journal of
      Statistical Software}, Volume 17, code snippet 1
    \item R. K. S. Hankin 2007.  \dQuote{Set partitions in
      \R}. \emph{Journal of Statistical Software}, Volume
    23, code snippet 2
    \item N. J. A. Sloane, 2008, The On-Line Encyclopedia of Integer
    Sequences.  Sequence A001700
    \item D. Knuth, 2004.  The art of computer programming, pre-fascicle
  2B \dQuote{Generating all permutations}
  }
}
\examples{
parts(5)
diffparts(10)
matplot(t(diffparts(27)),type='l',lty=1)

restrictedparts(9,4)
restrictedparts(9,4,FALSE)
restrictedparts(9,4,decreasing=TRUE)

blockparts(1:4)
blockparts(1:4,3)
blockparts(1:4,3,include.fewer=TRUE)

blockparts(c(4,3,3,2),5)  # Knuth's example, pre-fascicle 3a, p16

compositions(4)           # not the same as parts(4)
compositions(4,4) 

# With 10 blocks, enumerate all partitions with maxima of 1:5 and minima
# of c(0,1,1,2,1):

a <- c(0,1,1,2,1)
sweep(blockparts(1:5-a,10-sum(a)),1,a,"+")

#Knuth's example:
multiset(c(1,2,2,3))

multiset(rep(4+1:3,1:3),3)
}
\keyword{math}
