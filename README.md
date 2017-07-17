ggpub
================

[![Travis-CI Build Status](https://travis-ci.org/acnb/ggpub.png?branch=master)](https://travis-ci.org/acnb/ggpub)

ggpub
=====

This package makes the creation of publication ready figures with ggplot a tiny bit easier. It trys to determine good defaults and is verbose about them.

``` r
library(ggplot2)
library(ggthemes)
library(ggpub) # determines good defaults at attachment
```

    ## Figures of type png will be saved in C:/Users/andi/Documents/RCode/ggpub/fig. This directory will be created if it does not exist. The plot resolution will be 300 dpi.

``` r
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point() +
  theme_pub()
```

![](README_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-1-1.png)

``` r
ggpub('iris') # saves the last plot in a default 'fig' directory.
```

This package is not on CRAN yet. To install please run

``` r
install.packages("devtools")
library(devtools)
install_github("acnb/ggpub")
```
