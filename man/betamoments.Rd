% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/betafunctions.R
\name{betamoments}
\alias{betamoments}
\title{Compute Moments of Two-to-Four Parameter Beta Probability Density Distributions.}
\usage{
betamoments(
  alpha,
  beta,
  l = 0,
  u = 1,
  types = c("raw", "central", "standardized"),
  orders = 4
)
}
\arguments{
\item{alpha}{The alpha shape parameter of the PDD.}

\item{beta}{The beta shape parameter of the PDD.}

\item{l}{The first (lower) location parameter of a four-parameter distribution.}

\item{u}{The second (upper) location parameter of a four-parameter distribution.}

\item{types}{A character vector determining which moment-types are to be calculated. Permissible values are "raw", "central", and "standardized".}

\item{orders}{The number of moment-orders to be calculated for each of the moment-types.}
}
\value{
A list of moment types, each a list of moment orders.
}
\description{
Computes Raw, Central, or Standardized moment properties of defined Standard Beta probability density distributions.
}
\examples{
# Assume some variable follows a four-parameter Beta distribution with
# location parameters l = 0.25 and u = 0.75, and shape parameters a = 5
# and b = 3. To compute the first four raw, central, and standardized
# moments of this distribution using betamoments():
betamoments(a = 5, b = 3, l = 0.25, u = 0.75,
types = c("raw", "central", "standardized"), orders = 4)
}
\references{
Hanson, B. A (1991). Method of Moments Estimates for the Four-Parameter Beta Compound Binomial Model and the Calculation of Classification Consistency Indexes. American College Testing Research Report Series.
}
