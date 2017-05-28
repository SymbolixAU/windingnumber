library(googleway)
mapKey <- read.dcf("~/Documents/.googleAPI", fields = "GOOGLE_MAP_KEY")

### ----------------------------------------------------------------------------

## closed polygon, point inside
polyX = c(51.5, 51.9, 51.9, 51.5, 51.5)
polyY = c(1.05, 1.05, -1.05, -1.05, 1.05)

## roughly Greenwhich
pointX = 51.6
pointY = 0

df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(10)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}

## point is inside the polygon, so should all be non-zero
sum(testResults == 0)
sum(diff(testResults) == 0) == (length(testResults) - 1)

### ----------------------------------------------------------------------------

### non-closed polygon, point inside
polyX = c(51.5, 51.9, 51.9, 51.5)
polyY = c(1.05, 1.05, -1.05, -1.05)

## roughly Greenwhich
pointX = 51.6
pointY = 0

df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(1000)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}

## the point is inside the polygon, so the winding number should be non-zero
sum(testResults == 0)
sum(diff(testResults) == 0) == (length(testResults) - 1)

### ----------------------------------------------------------------------------

## closed polygon, point outside
polyX = c(51.5, 51.9, 51.9, 51.5, 51.5)
polyY = c(1.05, 1.05, -1.05, -1.05, 1.05)

## roughly Greenwhich
pointX = 52.0
pointY = 0


df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(20)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}

## point is outside the polygon, so should all be zero
sum(testResults == 0)
## test all results are the same
sum(diff(testResults) == 0) == (length(testResults) - 1)

### ----------------------------------------------------------------------------

## non-closed polygon, point outside
polyX = c(51.5, 51.9, 51.9, 51.5)
polyY = c(1.05, 1.05, -1.05, -1.05)

## roughly Greenwhich
pointX = 52.0
pointY = 0


df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(20)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}

## point is outside the polygon, so should all be 0
sum(testResults == 0)
## test all results are the same
sum(diff(testResults) == 0) == (length(testResults) - 1)

### ----------------------------------------------------------------------------

## closed complex polygon - point outside
polyX = c(51.5, 51.9, 51.9, 51.5, 51.5, 51.6, 51.6, 51.5, 51.5)
polyY = c(1.05, 1.05, -1.05, -1.05, -0.5, -0.5, 0.5, 0.5, 1.05)

pointX = 51.55
pointY = 0


df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(20)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}

## point is outside the polygon, so should all be 0
sum(testResults == 0)
## test all results are the same
sum(diff(testResults) == 0) == (length(testResults) - 1)


### ----------------------------------------------------------------------------

## closed complex polygon - point inside
polyX = c(51.5, 51.9, 51.9, 51.5, 51.5, 51.6, 51.6, 51.5, 51.5)
polyY = c(1.05, 1.05, -1.05, -1.05, -0.5, -0.5, 0.5, 0.5, 1.05)

pointX = 51.7
pointY = 0


df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(20)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}

## point is inside the polygon, so should be non-zero
sum(testResults == 0)
## test all results are the same
sum(diff(testResults) == 0) == (length(testResults) - 1)

### ----------------------------------------------------------------------------

### Polygon defined clockwise
### ----------------------------------------------------------------------------

## closed polygon, point inside
polyX = rev(c(51.5, 51.9, 51.9, 51.5, 51.5))
polyY = rev(c(1.05, 1.05, -1.05, -1.05, 1.05))

## roughly Greenwhich
pointX = 51.6
pointY = 0


df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(1000)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}

## point is inside the polygon, so should all be non-zero
sum(testResults == 0)
sum(diff(testResults) == 0) == (length(testResults) - 1)

testResults <- numeric(1000)
for(i in seq_along(testResults)){
  testResults[i] <- spatial.data.table::WindingNumber(pointX, pointY, polyX, polyY)
}

## point is inside the polygon, so should all be non-zero
sum(testResults == 0)
sum(diff(testResults) == 0) == (length(testResults) - 1)


### ----------------------------------------------------------------------------

## non-closed polygon, point inside
polyX = rev(c(51.5, 51.9, 51.9, 51.5))
polyY = rev(c(1.05, 1.05, -1.05, -1.05))


## roughly Greenwhich
pointX = 51.6
pointY = 0

df_poly <- data.frame(lat = polyX, lon = polyY, drag = TRUE)
df_poly$info <- paste0(df_poly$lat, ",", df_poly$lon)
df_point <- data.frame(lat = pointX, lon = pointY, colour = "green")

google_map(key = mapKey) %>%
  add_markers(data = df_poly, draggable = "drag", info_window = "info") %>%
  add_polylines(data = df_poly, lat = "lat", lon = "lon") %>%
  add_markers(data = df_point, colour = "colour")


testResults <- numeric(1000)
for(i in seq_along(testResults)){
  testResults[i] <- windingnumber::WindingNumber(pointX, pointY, polyX, polyY)
}


## the point is inside the polygon, so the winding number should be non-zero
sum(testResults == 0)
sum(diff(testResults) == 0) == (length(testResults) - 1)

testResults <- numeric(1000)
for(i in seq_along(testResults)){
  testResults[i] <- spatial.data.table::WindingNumber(pointX, pointY, polyX, polyY)
}

## the point is inside the polygon, so the winding number should be non-zero
sum(testResults == 0)
sum(diff(testResults) == 0) == (length(testResults) - 1)



## cpp precision test
#
# library(Rcpp)
#
# cppFunction('bool precisionTest(double a, double b){
#             return a < b;
#             }')
#
# a <- 1.23007e+214
# b <- 0
#
# testResults <- numeric(10000)
# for(i in seq_along(testResults)){
#   testResults[i] <- precisionTest(a, b)
# }
# sum(testResults)
