
<!-- README.md is generated from README.Rmd. Please edit that file -->

# R Training <img src='man/figures/logo.png' align="right" height="120" style="background:none; background-color: transparent !important; border:none; box-shadow:none;" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Project Status:
WIP](https://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
<!-- badges: end -->

### Contents

- [Package HomePage](https://jimbrig.github.io/rtraining/)
- [R Setup
  Guide](https://jimbrig.github.io/rtraining/articles/setting-up-r.html)
- [R Shiny Training
  Resources](https://jimbrig.github.io/rtraining/articles/shiny-training.html)
- [List of Helpful
  Bookdowns](https://jimbrig.github.io/rtraining/articles/bookdown-list.html)

------------------------------------------------------------------------

<!-- description: start -->

Package {rtraining}: R Training Resources, Guides, Tips, and Knowledge
Base.  
Current version is 0.0.1.

------------------------------------------------------------------------

The goal of `rtraining` is to provide useful resources, knowledge, and
walkthroughs for new R developers.

The package is split into three main areas:

1.  R Setup and Configuration: a thorough walkthrough for setting up and
    configuring R, RStudio, and various other software in an efficient
    manner.

2.  R Workflows: example workflows showcasing the main types of work
    done with R, including, but not limited to R Data Analysis Projects,
    Reporting with RMarkdown, R Shiny Applications, R Package
    Development.

3.  R Tips & Tricks: General tips and tricks learned over time from my
    experiences with R.

<!-- description: end -->

## Installation

<!-- install: start -->

You can install the released version of rtraining from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("rtraining")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jimbrig/rtraining")
```

------------------------------------------------------------------------

The list of dependencies required to install this package is:
attachment, chameleon, devtools, knitr, pkgdown, rmarkdown, roxygen2,
utils, xfun.

To install the package, you can run the following script

``` r
# install.packages("remotes")
remotes::install_local(path = "rtraining_0.0.1.tar.gz")
```

In case something went wrong, you may want to install dependencies
before using:

``` r
# Remotes ----
install.packages("remotes")
remotes::install_github('ThinkR-open/chameleon')
# Attachments ----
to_install <- c("xfun")
  for (i in to_install) {
    message(paste("looking for ", i))
    if (!requireNamespace(i)) {
      message(paste("     installing", i))
      install.packages(i)
    }
  }
```

Once you have the package installed you can open the website directly by
running:

``` r
library(rtraining)
rtraining::open_pkgdown()
```

Similarly you can open the package `bookdown` with:

``` r
rtraining::open_guide()
```

<!-- install: end -->
