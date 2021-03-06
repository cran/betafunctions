% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/betafunctions.R
\name{AMS}
\alias{AMS}
\title{Alpha Shape-Parameter Given Location-Parameters, Mean, Variance, Skewness, Kurtosis and Beta Shape-Parameter of a Four-Parameter Beta PDD.}
\usage{
AMS(
  mean = NULL,
  variance = NULL,
  skewness = NULL,
  kurtosis = NULL,
  l = 0,
  u = 1,
  beta = NULL,
  sd = NULL
)
}
\arguments{
\item{mean}{The mean (first raw moment) of the target Standard Beta probability density distribution.}

\item{variance}{The variance (second central moment) of the target Standard Beta probability density distribution.}

\item{skewness}{The skewness (third standardized moment) of the target Beta probability density distribution.}

\item{kurtosis}{The kurtosis (fourth standardized moment) of the target Beta probability density distribution.}

\item{l}{The lower-bound of the Beta distribution. Default is 0 (i.e., the lower-bound of the Standard, two-parameter Beta distribution).}

\item{u}{The upper-bound of the Beta distribution. Default is 1 (i.e., the upper-bound of the Standard, two-parameter Beta distribution).}

\item{beta}{Optional specification of the Beta shape-parameter of the target Beta distribution. Finds then the Alpha parameter necessary to produce a distribution with the specified mean, given specified Beta, l, and u parameters.}

\item{sd}{Optional alternative to specifying \code{var}. The standard deviation of the target Standard Beta probability density distribution.}
}
\value{
A numeric value representing the required value for the Alpha shape-parameter in order to produce a  Beta probability density distribution with the target mean and variance, given specified lower- and upper bounds of the Beta distribution.
}
\description{
Calculates the Beta value required to produce a Beta probability density distribution with defined moments and parameters. Be advised that not all combinations of moments and parameters can be satisfied (e.g., specifying mean, variance, skewness and kurtosis uniquely determines both location-parameters, meaning that the value of the lower-location parameter will take on which ever value it must, and cannot be specified).
}
\examples{
# Generate some fictional data. Say, 100 individuals take a test with a
# maximum score of 100 and a minimum score of 0, rescaled to proportion
# of maximum.
set.seed(1234)
testdata <- rbinom(100, 100, rBeta.4P(100, 0.25, 0.75, 5, 3)) / 100
hist(testdata, xlim = c(0, 1))

# To find the alpha shape-parameter of a Standard (two-parameter) Beta
# distribution with the same mean and variance as the observed-score
# distribution using AMS():
AMS(mean(testdata), var(testdata))
}
