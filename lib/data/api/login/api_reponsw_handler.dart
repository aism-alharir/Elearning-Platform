
import 'dart:io';

import 'package:e_learningplatform/data/api/login/api_result.dart';
import 'package:e_learningplatform/data/api/login/failure.dart';
import 'package:e_learningplatform/data/model/login/app_constants.dart';


class APIResponseErrorHandler {
  static APIResult parseError(ex) {
    APIResult result = APIResult();

    if (ex is FormatException) {
      result.hasError = true;

      result.failure = Failure(AppConstants.ERROR_NO_BODY_PARSING_CODE,
          "Problem parsing data from the server");
    } else if (ex is SocketException) {
      result.hasError = true;
      result.failure = Failure(
          AppConstants.ERROR_NO_CONNECTION_CODE, "Can't connect to internet");
    } else {
      result.hasError = true;
      result.failure =
          Failure(AppConstants.ERROR_NO_CONNECTION_CODE, ex.toString());
    }

    return result;
  }
}