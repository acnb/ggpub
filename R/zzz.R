has_fig <- rprojroot::has_dirname('fig')

.onAttach <- function(libname, pkgname) {
  fig_crits <- has_fig |
    rprojroot::is_rstudio_project |
    rprojroot::is_r_package |
    rprojroot::is_remake_project |
    rprojroot::is_projectile_project |
    rprojroot::is_vcs_root |
    rprojroot::from_wd

  try(root <- rprojroot::find_root(fig_crits), silent = TRUE)

  op <- options()
  op.ggpub <- list(
    ggpub.dpi = 300,
    ggpub.type = 'png'
  )

  if(!is.null(root)){
    op.ggpub['ggpub.path'] = file.path(root, 'fig')
  }

  toset <- !(names(op.ggpub) %in% names(op))
  if(any(toset)) options(op.ggpub[toset])

  packageStartupMessage(showGgpubDefaults())

}
