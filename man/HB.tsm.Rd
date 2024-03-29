% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classification.R
\name{HB.tsm}
\alias{HB.tsm}
\title{Proportional True-Score Distribution Raw Moments for the Hanson-Brennan Approach to Classification Accuracy and Consistency.}
\usage{
HB.tsm(x, r, N, k)
}
\arguments{
\item{x}{Vector of values representing sum-scores.}

\item{r}{The number of raw moments to be calculated.}

\item{N}{The number of test items (i.e., test length).}

\item{k}{Lord's k (see documentation for the \code{Lords.k()} function.}
}
\description{
An implementation of Lords (1965, p. 265) equation 37 for estimating the raw moments of the true-score distribution.
}
\examples{
# Generate some data under the Beta Compound-Binomial distribution, where the
# Compound Binomial distribution has 100 trials and Lord's k = 2, and the
# Beta distribution has location parameters l = .15 and u = .85, and shape
# parameters alpha = 6 and beta = 4:
obs <- rBetacBinom(1000, 100, 2, .15, .85, 6, 4)

# To estimate the first four raw moments of the underlying Beta distribution:
HB.tsm(x = obs, r = 4, N = 100, k = 2)
}
