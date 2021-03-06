% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classification.R
\name{tsm}
\alias{tsm}
\title{Proportional true-score distribution raw moments from Livingston and Lewis' effective test-score and effective test-length.}
\usage{
tsm(x, r, n, method = "product")
}
\arguments{
\item{x}{The effective test-score of test-takers.}

\item{r}{The moment-order that is to be calculated (where 1 is the mean, 2 is the raw variance, 3 is the raw skewness, etc.).}

\item{n}{The effective test-length.}

\item{method}{The method by which the descending factorials are to be calculated. Default is \code{"product"} which uses direct arithmetic. Alternative is "gamma" which calculates the descending factorial using the Gamma function. The alternative method might be faster but might fail because the Gamma function is not defined for negative integers (returning Inf).}
}
\description{
An implementation of Lords (1965, p. 265) equation 37 for estimating the raw moments of the true-score distribution, modified to function for the Livingston and Lewis approach.
}
\examples{
# Examine the raw moments of the underlying Beta distribution that is to provide the basis for
# observed-scores:
betamoments(alpha = 5, beta = 3, l = 0.25, u = 0.75, types = "raw")

# Generate observed-scores from true-scores by passing the true-scores as binomial probabilities
# for the rbinom function.
set.seed(1234)
obs.scores <- rbinom(1000, 100, rBeta.4P(1000, 0.25, 0.75, 5, 3))
# Examine the raw moments of the observed-score distribution.
observedmoments(obs.scores, type = "raw")

# First four estimated raw moment of the proportional true-score distribution from the observed-
# score distribution. As all items are equally difficult, the effective test-length is equal to
# the actual test-length.
tsm(x = obs.scores, r = 1, n = 100)
tsm(x = obs.scores, r = 2, n = 100)
tsm(x = obs.scores, r = 3, n = 100)
tsm(x = obs.scores, r = 4, n = 100)
# Which is fairly close to the true raw moments of the proportional true-score distribution
# calculated above.
}
\references{
Lord, F. M. (1965). A strong true-score theory, with applications. Psychometrika. 30(3). pp. 239--270. doi: 10.1007/BF02289490

Livingston, Samuel A. and Lewis, Charles. (1995). Estimating the Consistency and Accuracy of Classifications Based on Test Scores. Journal of Educational Measurement, 32(2).
}
