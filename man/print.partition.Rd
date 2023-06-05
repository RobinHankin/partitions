\name{print.partition}
\alias{print.partition}
\alias{print.equivalence}
\alias{print.summary.partition}
\alias{print}
\title{Print methods for partition objects and equivalence objects}
\description{
  A print method for partition objects, summary partition objects, and
  equivalence classes.  Includes various configurable options
}
\usage{
\S3method{print}{partition}(x, mat = getOption("matrixlike"), h = getOption("horiz"), ...)
\S3method{print}{summary.partition}(x, ...)
\S3method{print}{equivalence}(x, sep = getOption("separator"), ...)
}
\arguments{
  \item{x}{Object to be printed: an object of class either
    \code{partition} or \code{summary.partition}}
  \item{mat}{Boolean, with \code{TRUE} meaning to print like a matrix,
    and any other value meaning to print without column names (which
    usually results in more compact appearance)}
  \item{h}{Boolean governing the orientation of the printed matrix, with
    \code{TRUE} meaning to print with the rows being the partitions and 
    any other value (the default) meaning to print the transpose}
  \item{sep}{Character vector, with special value of \code{NULL}
    interpreted as a comma; see examples section}
  \item{\dots}{Further arguments provided for compatibility}
}
\details{

  The print method is sensitive to the value of option \code{matrixlike}
  which by default sets column names to a space for more compact
  printing.  Set to \code{TRUE} to print a partition like a matrix.
  Option \code{horiz} specifies whether or not to print a partition
  horizontally.
}
\author{Robin K. S. Hankin}
\note{

  The print method for objects of class \code{equivalence} gives things
  like

\preformatted{
listParts(3:1)
[[1]]
[1] {1,2,6}{4,5}{3}

[[2]]
[1] {1,2,6}{3,4}{5}

...

[[59]]
[1] {4,5,6}{1,2}{3}

[[60]]
[1] {4,5,6}{2,3}{1} 
}
  

The curly brackets are to remind you that function \code{listParts()}
gives \emph{set} partitions, not cycle representation of a permutation
as per the \CRANpkg{permutations} package.
}
\examples{
print(parts(5))

summary(parts(7))

listParts(3)
options(separator="")
listParts(5)

}
\keyword{math}
