#include <Rcpp.h>
#include "util.h"
using namespace Rcpp;

/**
 * Winding Number
 *
 * Calculates the winding number for a point and polygon
 *
 * @param pointX
 * @param pointY
 * @param vectorX numeric vector representing the x coordinates of a polygon
 * @param vectorY numeric vector representing the y coordinates of a polygon
 *
 */
// [[Rcpp::export]]
double rcppWindingNumber(double pointX, double pointY,
                         NumericVector vectorX, NumericVector vectorY,
                         bool debugIsClosed, bool debugClosePoly){

  int windingNumber = 0;  // winding number counter
  int nVector = vectorX.size() - 1;

  //Rcpp::Rcout <<  "winding number: "<< std::endl;

  // check if the polygon is closed
  if(!isPolygonClosed(vectorX[0], vectorX[nVector],
                      vectorY[0], vectorY[nVector])){

    //Rcpp::Rcout << "not closed " << std::endl;
    //Rcpp::Rcout << vectorX[0] << " - " << vectorX[nVector] << std::endl;
    //Rcpp::Rcout << vectorY[0] << " - " << vectorY[nVector] << std::endl;

    if (debugIsClosed == true){
      return -1.0;
    }else{
      // close polygon
      vectorX = ClosePolygon(vectorX);
      vectorY = ClosePolygon(vectorY);

      //Rcpp::Rcout << "closed polygons " << std::endl;
      //Rcpp::Rcout << vectorX[0] << " - " << vectorX[nVector + 1] << std::endl;
      //Rcpp::Rcout << vectorY[0] << " - " << vectorY[nVector + 1] << std::endl;

      if( debugClosePoly == true){
        // return the size of the new vector
        return vectorX[vectorX.size()];
      }
    }
  }

  int n = vectorX.size() - 1; // number of rows of the polygon vector
  // compute winding number

  // loop all points in the polygon vector
  for (int i = 0; i < n; i++){   //
    //if(i == 4){
    //  Rcpp::Rcout << "i == 4" << std::endl << "vectorY[i]: " << vectorY[i] << ", pointY: " << pointY << ", vectorY[i+1]: " << vectorY[i + 1] << std::endl;
    //
    //  for( int j = 0; j < vectorX.size(); j++){
    //    Rcpp::Rcout << vectorX[j] << ", " << vectorY[j] << std::endl;
    //    //      Rcpp::Rcout << vectorY[i] << std::endl;
    //  }
    //
    //}
    if (vectorY[i] <= pointY){
      if (vectorY[i + 1] > pointY){
        //if (isLeft(vectorX[i], vectorY[i], vectorX[i + 1], vectorY[i + 1], pointX, pointY) > 0){
        if ( ((vectorX[i + 1] - vectorX[i]) * (pointY - vectorY[i]) - (pointX - vectorX[i]) * (vectorY[i + 1] - vectorY[i])) > 0.0){
          ++windingNumber;
          //if(windingNumber > 1){
            //Rcpp::Rcout << "i: " << i << std::endl << ((vectorX[i + 1] - vectorX[i]) * (pointY - vectorY[i]) - (pointX - vectorX[i]) * (vectorY[i + 1] - vectorY[i])) << std::endl;
          //}
        }
      }
    }else{
      if (vectorY[i + 1] <= pointY){
        if (isLeft(vectorX[i], vectorY[i], vectorX[i + 1], vectorY[i + 1], pointX, pointY) < 0.0){
        //if( ((vectorX[i+1] - vectorX[i]) * (pointY - vectorY[i]) - (pointX - vectorX[i]) * (vectorY[i + 1] - vectorY[i])) < 0){
          --windingNumber;
        }
      }
    }
  }

  if(windingNumber > 1 || windingNumber < -1){
    Rcpp::Rcout << "winding number x2..." << std::endl;
    Rcpp::Rcout << pointX << ", " << pointY  << std::endl;

    for( int i = 0; i < vectorX.size(); i++){
      Rcpp::Rcout << vectorX[i] << ", " << vectorY[i] << std::endl;
//      Rcpp::Rcout << vectorY[i] << std::endl;
    }
  }

  return windingNumber;
}

