
#  ------------------------------------------------------------------------
#
# Title : R Training Package Development History Script
#    By : Jimmy Briggs <jimbrig2011@gmail.com> <jimmy.briggs@oliverwyman.com>
#  Date : 2020-06-02
#
#  ------------------------------------------------------------------------


# initialize package ------------------------------------------------------

# setwd("~/<path-to-desired-folder-for-project>")
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
dirs <- c("inst/scripts", "inst/resources", "man/figures")
fs::dir_create(dirs, recurse = TRUE)
rm(dirs)

# setup Git and Github
# NOTE: GitHub PAT needs to be setup and Git installed and liked to RSA/SSH keys
usethis::use_git()
usethis::use_github(private = TRUE)
# run `git push --set-upstream origin master` in terminal/gitbash

# vaccinate and sitrep
usethis::git_vaccinate()
usethis::git_sitrep()

# setup namespace and roxygen
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_package_doc()

# readme
usethis::use_readme_rmd()
usethis::use_logo("man/figures/rstudio_logo.png")
usethis::use_lifecycle_badge("experimental")
usethis::use_badge(
  "Project Status: WIP",
  href = "http://www.repostatus.org/#wip",
  src = "https://www.repostatus.org/badges/latest/wip.svg"
)
knitr::knit("README.Rmd")

# package R documentation and basic imports
usethis::use_package_doc()
usethis::use_tibble() # #' @return a [tibble][tibble::tibble-package]
usethis::use_pipe() # move to package.R
usethis::use_tidy_eval() # move to package.R

# initial document
devtools::document()

# DESCRIPTION -------------------------------------------------------------

# set title and description for GH before making GH project
desc::desc_set(
  Title = "R Training Resources, Guides, Tips, and Knowledge Base",
  Description = "Houses variouse material realted to teaching R."
  )

# already set title and description for GH above

# authors
# I use my .Rprofile for this.

# package version
desc::desc_set_version("0.0.1")

#  R version
desc::desc_set("Depends", "R (>= 2.10)")

# license
# I use my .Rprofile for this.

# clean up
desc::desc_normalize()


# packages ----------------------------------------------------------------
usethis::use_package("pkgdown", type = "suggests")
usethis::use_package("attachment", type = "suggests")
usethis::use_package("xfun")
usethis::use_package("bookdown")

# data --------------------------------------------------------------------


# functions ---------------------------------------------------------------


# tests -------------------------------------------------------------------

# vignettes ---------------------------------------------------------------
usethis::use_vignette("setting-up-r", title = "Setting up R and RStudio")
usethis::use_vignette("bookdown-list", title = "R Bookdowns List")
usethis::use_vignette("shiny-training", title = "R Shiny Training Resources")

# check build tools -------------------------------------------------------
pkgbuild::check_build_tools()
devtools::dev_sitrep()

# update devt packages
rstudioapi::restartSession()
devtools::update_packages("devtools")


# initial build prep ------------------------------------------------------

# spellcheck
spelling::update_wordlist()
devtools::spell_check()

# knit README
knitr::knit("README.Rmd")

# update dependencies
rstudioapi::restartSession()
attachment::att_to_description(
  extra.suggests = c("devtools", "attachment", "roxygen2",
                     "pkgdown", "attachment", "chameleon",
                     "xfun")
)
attachment::create_dependencies_file(to = "inst/scripts/dependencies.R")

# document
devtools::document()

# check & test
devtools::check()
devtools::test()

# goodpractice check
# goodpractice::gp()

# install
devtools::install()

# builds
devtools::build()
devtools::build_vignettes()
devtools::build_manual()

# release
devtools::release()

# R CMD CHECK RESULTS -----------------------------------------------------
#   Duration: 1m 48s
#
# 0 errors v | 0 warnings v | 0 notes v
#
# R CMD check succeeded


# package down ------------------------------------------------------------
chameleon::create_book()
chameleon::build_book()
chameleon::build_pkgdown()

pkgdown::clean_site()
pkgdown::build_site()

chameleon::open_pkgdown_function()
chameleon::create_pkg_desc_file(out.dir = ".")
chameleon::open_guide_function(path = "inst/report")
devtools::document()

pkgdown::init_site()
pkgdown::build_articles()
