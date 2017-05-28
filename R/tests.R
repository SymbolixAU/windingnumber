
# polyX = c(1.05, 1.05, -89.5, -89.5, 1.05)
# polyY = c(53.0, 53.5, 53.5, 53.0, 53.0)
#
# ## roughly Greenwhich
# pointX = 0
# pointY = 52.89
#
# testResults <- numeric(10)
# for(i in seq_along(testResults)){
#   testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
# }
#
# sum(testResults != -1)
#
#
#
# library(Rcpp)
#
# cppFunction("bool compareNumbers(double startX, double endX, double startY, double endY){
#              return (startX == endX && startY == endY);
#             }")
#
# compareNumbers(2, 2, 3, 3)


