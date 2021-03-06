% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggpub.R
\name{ggpub}
\alias{ggpub}
\title{Create publication ready figure}
\usage{
ggpub(name, formatWidth = c("twoColumns", "oneColumn"), ...)
}
\arguments{
\item{name}{name of the figure without file extension (eg. '.jpg')}

\item{formatWidth}{target width for figure (twoColumns or oneColumn). Is
overwritten by 'width'.}

\item{...}{Other arguments passed on to gggsave.}
}
\description{
This is a drop-in replacement for \code{ggplot2::ggsave}. It tries to use good defaults to
make the whole process a tiny bit easier.
}
\details{
The only mandatory argument for ggpub is the name of the plot (without any file extension).
For everything else, defaults are used. Defaults can be changed using the setXYZ functions.
To save a figure with specific arguments but without changing the defaults, all arguments
of \code{ggsave} can be used. They always take precedence over defaults.
}
\examples{
\dontrun{
library(ggplot)
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +
 geom_point()
ggpub('iris', 'oneColumn')
}
}
