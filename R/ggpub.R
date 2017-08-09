#' Create publication ready figure
#'
#' This is a drop-in replacement for \code{ggplot2::ggsave}. It tries to use good defaults to
#' make the whole process a tiny bit easier.
#'
#' The only mandatory argument for ggpub is the name of the plot (without any file extension).
#' For everything else, defaults are used. Defaults can be changed using the setXYZ functions.
#' To save a figure with specific arguments but without changing the defaults, all arguments
#' of \code{ggsave} can be used. They always take precedence over defaults.
#'
#' @param name name of the figure without file extension (eg. '.jpg')
#' @param formatWidth target width for figure (twoColumns or oneColumn). Is
#'     overwritten by 'width'.
#' @param ... Other arguments passed on to gggsave.
#' @export
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#' library(ggplot)
#' ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +
#'  geom_point()
#' ggpub('iris', 'oneColumn')
#' }
ggpub <- function(name, formatWidth = c('twoColumns', 'oneColumn'), ...){
  args <- list(...)

  if (!"dpi" %in% names(args)){
    args["dpi"] <- getOption("ggpub.dpi")
  }

  if (!"device" %in% names(args)){
    args["device"] <- getOption("ggpub.type")
  }

  if (!"path" %in% names(args)){
    args["path"] <- getOption("ggpub.path")
  }

  if (!"width" %in% names(args)){
    formatWidth <- match.arg(formatWidth)
    if (formatWidth == "twoColumns"){
      args["width"] <- getOption("ggpub.widthTwoColumns")
    }
    else {
      args["width"] <- getOption("ggpub.widthOneColumn")
    }
  }

  if (!"height" %in% names(args)){
      args["height"] <- ceiling(args[["width"]] *2/3)
  }

  if (!"units" %in% names(args)){
    args["units"] <- getOption("ggpub.units")
  }


  if (!dir.exists(args[["path"]])){
    dir.create(args[["path"]])
  }

  if (args["device"] == "pdf" & !"useDingbats" %in% names(args)){
    args["useDingbats"]  <- FALSE
  }

  args["filename"] <- paste0(name, ".", args[["device"]])

  do.call(ggsave, args)
}


#' Clean theme for publications
#'
#' A clean theme based on the theme by Koundinya Desiraju (https://rpubs.com/Koundy/71792).
#'
#' @param base_size base font size
#' @param base_family base font family
#'
#' @export
#' @import ggthemes
#'
#' @examples
#' \dontrun{
#' library(ggplot)
#' ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
#'  geom_point() +
#'  theme_pub()
#' }
theme_pub <- function(base_size = 12, base_family = "") {
  (theme_foundation(base_size = base_size, base_family = base_family) +
     theme(
       plot.title = element_text(face = "bold", size = rel(1.2), hjust = 0.5),
       text = element_text(),
       panel.background = element_rect(colour = NA),
       plot.background = element_rect(colour = NA),
       panel.border = element_rect(colour = NA),
       axis.title = element_text(face = "bold", size = rel(1)),
       axis.title.y = element_text(angle = 90, vjust = 2),
       axis.title.x = element_text(vjust = -0.2),
       axis.text = element_text(),
       axis.line = element_line(colour = "black"),
       axis.ticks = element_line(),
       panel.grid.major = element_line(colour = "#f0f0f0", size = .5),
       panel.grid.minor = element_blank(),
       legend.key = element_rect(colour = NA),
       legend.position = "bottom",
       legend.direction = "horizontal",
       legend.key.size = unit(0.2, "cm"),
       legend.spacing = unit(0, "cm"),
       legend.title = element_text(face = "italic"),
       plot.margin = unit(c(10, 5, 5, 5), "mm"),
       strip.background = element_rect(colour = "#f0f0f0", fill = "#f0f0f0"),
       strip.text = element_text(face = "bold")
     ))
}

#' Show current defaults of ggpub.
#'
#' @export
#'
#' @example
#' showGgpubDefaults()
showGgpubDefaults <- function(){
  dpi <- getOption("ggpub.dpi")
  type <- getOption("ggpub.type")
  path <- getOption("ggpub.path")
  twoColumns <- getOption("ggpub.widthTwoColumns")
  oneColumn <- getOption("ggpub.widthOneColumn")
  units <- getOption("ggpub.units")

  if (is.null(path)){
    output <- paste0("No directory for figures could be determined. ",
                     "Please supply one with setPath(option). Figures ",
                     "will be created of type ", type,
                     " with a resolution of ", dpi, " dpi. ")
  }
  else{
    output <- paste0("Figures of type ", type, " will be saved in ", path, ". ",
                     "This directory will be created if it does not exist. ",
                     "The plot resolution will be ", dpi, " dpi. ")
  }
  output <- paste0(output, "Width for figures spanning two columns or one column will be ",
                   twoColumns, " ", units, " and ", oneColumn, " ", units, " respectively.")

  output
}

#' Change defaults
#'
#' Functions to change the defaults for ggpub.
#'
#' @param option new value for default
#'
#' @export
#'
#' @examples
#' \dontrun{
#' setPath('my/new/path')
#' showGgpubDefaults() # Displays new default.
#' }
setPath <- function(option){
  options("ggpub.path" = option)
}

#' @rdname setPath
#' @export
setDpi <- function(option){
  options("ggpub.dpi" = option)
}


#' @rdname setPath
#' @export
setType <- function(option){
  options("ggpub.type" = option)
}

#' @rdname setPath
#' @export
setWidthTwoColumns <- function(option){
  options("ggpub.widthTwoColumns" = option)
}

#' @rdname setPath
#' @export
setWidthOneColumn <- function(option){
  options("ggpub.widthOneColumn" = option)
}

#' @rdname setPath
#' @export
setUnits <- function(option){
  options("ggpub.units" = option)
}
