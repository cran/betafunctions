% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classification.R
\name{LL.CA.MC}
\alias{LL.CA.MC}
\title{An Extension of the Livingston and Lewis (1995) Approach to Estimate Classification Consistency and Accuracy for Multiple Classifications based on Observed Test Scores and Test Reliability.}
\usage{
LL.CA.MC(
  x = NULL,
  reliability,
  cut,
  min = 0,
  max = 1,
  true.model = "4P",
  failsafe = TRUE,
  l = 0,
  u = 1,
  modelfit = c(nbins = 100, minbin = 10)
)
}
\arguments{
\item{x}{A vector of observed scores, or a list specifying parameter values. If a list is provided, the list entries must be named after the parameters: \code{l} and \code{u} for the location-, and \code{alpha} and \code{beta} for the shape parameters of the Beta true-score distribution, and \code{etl} for the effective test length (see documentation for the \code{ETL} function).}

\item{reliability}{The observed-score squared correlation (i.e., proportion of shared variance) with the true-score.}

\item{cut}{A vector of cut-off values for classifying observations into two or more categories.}

\item{min}{The minimum value possible to attain on the test. Default is 0.}

\item{max}{The maximum value possible to attain on the test. Default is 1 (assumes that the values contained in \code{x} represents proportions of maximum credit).}

\item{true.model}{The probability distribution to be fitted to the moments of the true-score distribution. Options are \code{"4P"} (default) and \code{"2P"}, referring to four- and two-parameter Beta distributions. The "4P" method produces a four-parameter Beta distribution with the same first four moments (mean, variance, skewness, and kurtosis) as the estimated true-score distribution, while the "2P" method produces a two-parameter Beta distribution with the first two moments (mean and variance) as the estimated true-score distribution.}

\item{failsafe}{Logical value indicating whether to engage the automatic fail-safe defaulting to the two-parameter Beta true-score distribution if the four-parameter fitting procedure produces impermissible parameter estimates. Default is \code{TRUE} (i.e., the function will engage failsafe if the four-parameter Beta-distribution fitting-procedure produced impermissible estimates).}

\item{l}{If \code{true.model = "2P"} or \code{failsafe = TRUE}, the lower-bound location parameter to be used in the two-parameter fitting procedure. Default is 0 (i.e., the lower-bound of the Standard Beta distribution).}

\item{u}{If \code{true.model = "2P"} or \code{failsafe = TRUE}, the upper-bound location parameter to be used in the two-parameter fitting procedure. Default is 1 (i.e., the upper-bound of the Standard Beta distribution).}

\item{modelfit}{Allows for controlling the chi-square test for model fit. The argument takes either a vector of two values, or \code{NULL}. If set to \code{NULL}, the model-fit test is not executed. If a vector of values is supplied, the first value is to represent the initial number of bins the distribution of scores is to be divided in to. This value is set to a default of 100. If this default results in too few bins to conduct the chi-square test, this value can be made larger. The second value represents the minimum expected number of observations that the bins should consist of. In accordance with standard recommendations for chi-square tests, the default value is set to 10.}
}
\value{
A list containing the estimated parameters necessary for the approach (i.e., the effective test-length and the beta distribution parameters), a chi-square test of model-fit, the confusion matrix containing estimated proportions of true/false positive/negative categorizations for a test, diagnostic performance statistics, and/or a classification consistency matrix and indices. Accuracy output includes a confusion matrix and diagnostic performance indices, and consistency output includes a consistency matrix and consistency indices \code{p} (expected proportion of agreement between two independent test administrations), \code{p_c} (proportion of agreement on two independent administrations expected by chance alone), and \code{Kappa} (Cohen's Kappa).
}
\description{
An implementation of what has been come to be known as the "Livingston and Lewis approach" to classification consistency and accuracy, which by employing a compound beta-binomial distribution assumes that true-scores conform to the four-parameter beta distribution, and errors of measurement to the binomial distribution. Under these assumptions, the expected classification consistency and accuracy of tests can be estimated from observed outcomes and test reliability.
}
\note{
It should be noted that this implementation differs from the original articulation of Livingston and Lewis (1995) in some respects. First, the procedure includes a number of diagnostic performance (accuracy) indices which the original procedure enables but that were not included. Second, the way consistency is calculated differs substantially from the original articulation of the procedure, which made use of a split-half approach. Rather, this implementation uses the approach to estimating classification consistency outlined by Hanson (1991).
}
\examples{
# Generate some fictional data. Say, 1000 individuals take a test with a
# maximum score of 100 and a minimum score of 0.
set.seed(1234)
p.success <- rBeta.4P(1000, 0.1, 0.95, 5, 3)
for (i in 1:100) {
  if (i == 1) {
    rawdata <- matrix(nrow = 1000, ncol = 100)
  }
  rawdata[, i] <- rbinom(1000, 1, p.success)
}

# Suppose the cutoff value for being placed in the lower category is a score
# below 50, second lowest 60, then 70, 80, and 90. Using the cba() function
# to estimate the reliability of this test, to use the LL.CA.MC() function
# or estimating diagnostic performance and consistency indices of
# classifications when using several cut-points:
LL.CA.MC(rowSums(rawdata), cba(rawdata), c(50, 60, 70, 80, 90), min = 0, max = 100)

# The output from this function can get quite verbose when operating with
# several cut-points. In order to retrieve only model parameter estimates:
LL.CA.MC(rowSums(rawdata), cba(rawdata), c(50, 60, 70, 80, 90), min = 0, max = 100)$parameters

# To retrieve only the model-fit estimate:
LL.CA.MC(rowSums(rawdata), cba(rawdata), c(50, 60, 70, 80, 90), min = 0, max = 100)$modelfit

# To retrieve only the diagnostic performance estimates:
LL.CA.MC(rowSums(rawdata), cba(rawdata), c(50, 60, 70, 80, 90), min = 0, max = 100)$accuracy

# To retrieve only the classification consistency indices:
LL.CA.MC(rowSums(rawdata), cba(rawdata), c(50, 60, 70, 80, 90), min = 0, max = 100)$consistency

# Alternatively, the MC.out.tabular() function can be used to organize the
# category-specific indices in a tabular format:
MC.out.tabular(LL.CA.MC(rowSums(rawdata), cba(rawdata), c(50, 60, 70, 80, 90), min = 0, max = 100))

}
\references{
Livingston, Samuel A. and Lewis, Charles. (1995). Estimating the Consistency and Accuracy of Classifications Based on Test Scores. Journal of Educational Measurement, 32(2).

Hanson, Bradley A. (1991). Method of Moments Estimates for the Four-Parameter Beta Compound Binomial Model and the Calculation of Classification Consistency Indexes. American College Testing.

Lord. Frederic M. (1965). A Strong True-Score Theory, With Applications. Psychometrika, 30(3).

Lewis, Don and Burke, C. J. (1949). The Use and Misuse of the Chi-Square Test. Psychological Bulletin, 46(6).
}
