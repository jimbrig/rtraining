#' Open pkgdown site of the package
#'
#' @importFrom utils browseURL
#'
#' @export
open_pkgdown <- function() {
  guide_path <- system.file('docs/index.html', package = 'rtraining')
  if (guide_path == "") {
    stop('There is no pkgdown site in ', 'docs/index.html')
  }

  utils::browseURL(paste0('file://', guide_path))
}
