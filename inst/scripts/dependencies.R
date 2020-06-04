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
