
#  ------------------------------------------------------------------------
#
# Title : R Training Package Development History Script
#    By : Jimmy Briggs <jimmy.briggs@oliverwyman.com>
#  Date : 2020-06-02
#
#  ------------------------------------------------------------------------


# initialize package ------------------------------------------------------

# setwd("~/1a-Work-Projects/R-Training-Workflows")
usethis::create_package("rtraining")

# ignore this script
usethis::use_build_ignore("development_history.R")

# package development libraries/dependencies
if (!require(pacman)) install.packages("pacman")
pacman::p_load(
  usethis,
  devtools,
  pkgbuild,
  pkgload,
  pkgdown,
  roxygen2,
  testthat,
  knitr,
  rmarkdown,
  desc,
  fs,
  attachment
)

# package directory skeleton
dirs <- c("inst/scripts", "inst/docs")
fs::dir_create(dirs, recurse = TRUE)
rm(dirs)

usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_package_doc()

# setup Git and Github
usethis::use_git()
usethis::use_github(private = TRUE)
usethis::git_vaccinate()
usethis::git_sitrep()

# readme
usethis::use_readme_rmd()
usethis::use_logo("man/figures/rstudio_logo.png")
usethis::use_lifecycle_badge("experimental")

# vignettes
usethis::use_vignette("setting-up-r", title = "Setting up R and RStudio")

