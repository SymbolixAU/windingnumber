#include <Rcpp.h>
using namespace Rcpp;

double isLeft(double p0x, double p0y, double p1x, double p1y, double p2x, double p2y){
  return ((p1x - p0x) * (p2y - p0y) - (p2x - p0x) * (p1y - p0y));
}

bool isPolygonClosed(double startX, double endX, double startY, double endY){
  return (startX == endX && startY == endY);
}

Rcpp::NumericVector ClosePolygon(Rcpp::NumericVector polyVector){
  double addToEnd = polyVector[0];
  polyVector.push_back(addToEnd);

  //Rcpp::Rcout << "closing polygon" << std::endl;

  //for (int i = 0; i < polyVector.size(); i++){
  //  Rcpp::Rcout << polyVector[i] << std::endl;
  //}

  return polyVector;
}




