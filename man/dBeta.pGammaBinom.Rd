% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/betafunctions.R
\name{dBeta.pGammaBinom}
\alias{dBeta.pGammaBinom}
\title{An implementation of a Beta-density Compound Cumulative Gamma-Binomial Distribution.}
\usage{
dBeta.pGammaBinom(x, l, u, alpha, beta, n, c, lower.tail = FALSE)
}
\arguments{
\item{x}{x-axis input for which \code{p} (proportion or probability) is to be computed.}

\item{l}{The lower-bound of the four-parameter Beta distribution.}

\item{u}{The upper-bound of the four-parameter Beta distribution.}

\item{alpha}{The alpha shape-parameter of the four-parameter Beta distribution.}

\item{beta}{The beta shape-parameter of the four-parameter Beta distribution.}

\item{n}{The number of "trials" for the Gamma-Binomial distribution.}

\item{c}{The "true-cut" (proportion) on the Gamma-Binomial distribution. Need not be an integer (unlike Binomial distribution).}

\item{lower.tail}{Logical. Whether to compute the lower or upper tail of the Binomial distribution. Default is \code{FALSE} (i.e., upper tail).}
}
\description{
The Beta Compound Binomial distribution: The product of the four-parameter Beta probability density function and the binomial cumulative probability mass function. Used in the Livingston and Lewis approach to classification accuracy and consistency, the output can be interpreted as the population density of passing scores produced at "x" (a value of true-score).
}
\examples{
# Given a four-parameter Beta distribution with parameters l = 0.25, u = 0.75,
# alpha = 5, and beta = 3, and a Binomial error distribution with number of
# trials (n) = 10 and a cutoff-point (c) at 50\% correct (i.e., proportion correct
# of 0.5), the population density of passing scores produced at true-score
# (x) = 0 can be calculated as:
dBeta.pGammaBinom(x = 0.5, l = 0.25, u = 0.75, a = 5, b = 3, n = 10, c = 0.5)

# Conversely, the density of failing scores produced at x can be calculated
# by passing the additional argument "lower.tail = TRUE" to the function.
# That is:
dBeta.pGammaBinom(x = 0.5, l = 0.25, u = 0.75, a = 5, b = 3, n = 10.1, c = 0.5,
lower.tail = TRUE)

#By integration, the population proportion of (e.g.) passing scores in some
#region of the true-score distribution (e.g. between 0.25 and 0.5) can be
#calculated as:
integrate(function(x) { dBeta.pGammaBinom(x, 0.25, 0.75, 5, 3, 10, 0.5) },
lower = 0.25, upper = 0.5)
}
\references{
Hanson, Bradley A. (1991). Method of Moments Estimates for the Four-Parameter Beta Compound Binomial Model and the Calculation of Classification Consistency Indexes.American College Testing Research Report Series.

Livingston, Samuel A. and Lewis, Charles. (1995). Estimating the Consistency and Accuracy of Classifications Based on Test Scores. Journal of Educational Measurement, 32(2).

Lord, Frederic M. (1965). A Strong True-Score Theory, With Applications. Psychometrika, 30(3).

Loeb, D. E. (1992). A generalization of the binomial coefficients. Discrete Mathematics, 105(1-3).
}
