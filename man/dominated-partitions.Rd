\name{dominated-partitions}
\alias{dominated-partitions}
\alias{dominatedPartitions}
\alias{dominatingPartitions}
\title{Dominated and dominating partitions}
\usage{
dominatedPartitions(lambda)

dominatingPartitions(lambda)
}
\arguments{
\item{lambda}{an integer partition}
}
\value{
A set of integer partitions.
}
\description{
Returns the partitions dominated by a given partition or
  dominating this partition.
}
\examples{
dominatedPartitions(c(2, 1, 1))
dominatingPartitions(c(2, 1, 1))
}
