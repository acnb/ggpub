% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggpub.R
\name{theme_pub}
\alias{theme_pub}
\title{Clean theme for publications}
\usage{
theme_pub(base_size = 12, base_family = "")
}
\arguments{
\item{base_size}{base font size}

\item{base_family}{base font family}
}
\description{
A clean theme based on the theme by Koundinya Desiraju (https://rpubs.com/Koundy/71792).
}
\examples{
\dontrun{
library(ggplot)
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
 geom_point() +
 theme_pub()
}
}
