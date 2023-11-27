import 'package:dio/dio.dart';
import 'package:fakestore/core/constants/project_urls.dart';

class DioConfig {
  static Dio createRequest() {
    Dio dio = Dio(BaseOptions(
        baseUrl: ProjectUrls.baseUrl, // project base url
        validateStatus: (int? statusCode) {
          if (statusCode != null) {
            if (statusCode >= 100 && statusCode <= 511) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
        receiveDataWhenStatusError: true));

    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);
    return dio;
  }

  static String catchError(DioException e) {
    switch (e.type) {
      case DioExceptionType.receiveTimeout:
        return 'Receive time out';
      case DioExceptionType.connectionTimeout:
        return 'Connect time out';
      case DioExceptionType.sendTimeout:
        return 'Send time out';
      case DioExceptionType.badResponse:
        return 'Connection time out';
      case DioExceptionType.connectionError:
        return 'No internet';
      default:
        return e.message??"Something went wrong";
    }
  }
}
