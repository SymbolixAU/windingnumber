#' Winding Number
#'
#' Calculates the winding number for a point and polygon. Returns 0 when the point
#' is outside the polygon
#'
#' @param pointX x-coordinate of a point
#' @param pointY y-coordinate of a point
#' @param polyX x-coordinates of the polygon
#' @param polyY y-coordinates of thepolygon
#'
#' @export
WindingNumber <- function(pointX, pointY, polyX, polyY,
                          debugIsClosed = FALSE, debugClosePoly = FALSE){
  rcppWindingNumber(pointX, pointY, polyX, polyY, debugIsClosed, debugClosePoly)

}
