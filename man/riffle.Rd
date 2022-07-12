\name{riffle}
\alias{riffle}
\alias{allriffles}
\title{Riffle shuffles}
\description{\loadmathjax
  Enumeration of riffle shuffles
}
\usage{
riffle(p,q=p)
allriffles(n)
}
\arguments{
  \item{p,q}{Integers specifying length of the increasing sequences}
  \item{n}{Size of pack}
}
\details{

  A \dfn{riffle shuffle} is a permutation of integers
  \mjeqn{1,2,\ldots,n}{1,2,...,n} containing one or two rising
  sequences.

  \code{riffle(p,q)} returns a riffle shuffle of rising sequence
  \code{1:p} and \code{(p+1):q}; function \code{allriffles(n)} returns
  all riffle shuffles of the type \code{p,q} with \mjseqn{p+q=n}.

\preformatted{ 
> riffle(4,2)
                                  
[1,] 1 1 1 1 5 1 1 1 5 1 1 5 1 5 5
[2,] 2 2 2 5 1 2 2 5 1 2 5 1 5 1 6
[3,] 3 3 5 2 2 3 5 2 2 5 2 2 6 6 1
[4,] 4 5 3 3 3 5 3 3 3 6 6 6 2 2 2
[5,] 5 4 4 4 4 6 6 6 6 3 3 3 3 3 3
[6,] 6 6 6 6 6 4 4 4 4 4 4 4 4 4 4
> riffle(2,4)
                                  
[1,] 1 1 3 1 3 3 1 3 3 3 1 3 3 3 3
[2,] 2 3 1 3 1 4 3 1 4 4 3 1 4 4 4
[3,] 3 2 2 4 4 1 4 4 1 5 4 4 1 5 5
[4,] 4 4 4 2 2 2 5 5 5 1 5 5 5 1 6
[5,] 5 5 5 5 5 5 2 2 2 2 6 6 6 6 1
[6,] 6 6 6 6 6 6 6 6 6 6 2 2 2 2 2
> allriffles(5)
                                                          
[1,] 1 2 2 2 2 1 3 1 3 3 1 3 3 3 1 1 4 1 1 4 1 4 4 1 1 1 5
[2,] 2 1 3 3 3 3 1 3 1 4 3 1 4 4 2 4 1 2 4 1 4 1 5 2 2 5 1
[3,] 3 3 1 4 4 2 2 4 4 1 4 4 1 5 4 2 2 4 2 2 5 5 1 3 5 2 2
[4,] 4 4 4 1 5 4 4 2 2 2 5 5 5 1 3 3 3 5 5 5 2 2 2 5 3 3 3
[5,] 5 5 5 5 1 5 5 5 5 5 2 2 2 2 5 5 5 3 3 3 3 3 3 4 4 4 4
}
}
\value{
  Returns a matrix of class \code{partition} with columns being 
  riffle shuffles
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{parts}}}
\examples{
riffle(3,4)
allriffles(4)
}