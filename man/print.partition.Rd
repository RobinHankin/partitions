\name{print.partition}
\alias{print.partition}
\alias{as.character.partition}
\alias{print.equivalence}
\alias{as.character.equivalence}
\alias{print.summary.partition}
\alias{print}
\alias{as.character}
\title{Print and as.character methods for partition objects and equivalence objects}
\description{
  Methods for printing and casting to character of partition objects, summary partition objects, and
  equivalence classes.  Includes various configurable options.
}
\usage{
\S3method{print}{partition}(x, mat = getOption("matrixlike"), h = getOption("horiz"), ...)
\S3method{as.character}{partition}(x, mat = getOption("matrixlike"), h = getOption("horiz"), ...)
\S3method{print}{summary.partition}(x, ...)
\S3method{print}{equivalence}(x, sep = getOption("separator"), ...)
\S3method{as.character}{equivalence}(x, sep = getOption("separator"), ...)
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
\author{Robin K. S. Hankin}
\examples{
print(parts(5))
as.character(parts(5))

summary(parts(7))

as.character(listParts(3)[[2]])

listParts(3)
options(separator="")
listParts(5)

}
\keyword{math}
