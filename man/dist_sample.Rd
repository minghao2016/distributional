% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dist_sample.R
\name{dist_sample}
\alias{dist_sample}
\title{Sampling distribution}
\usage{
dist_sample(x)
}
\arguments{
\item{x}{A list of sampled values.}
}
\description{
\lifecycle{stable}
}
\examples{
dist_sample(x = list(rnorm(100), rnorm(100, 10)))

}
