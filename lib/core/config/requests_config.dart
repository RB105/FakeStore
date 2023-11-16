import 'package:dio/dio.dart';
import 'package:fakestore/core/config/dio_config.dart';
import 'package:fakestore/core/config/network_config.dart';

mixin DioRequestConfig {
  // POST request config
  Future<NetworkResponse> postRequest(
      {required String endPoint, required Map<String, dynamic> params}) async {
    try {
      // get instance from dio
      Dio dio = DioConfig.createRequest();

      // send request to given url
      Response response = await dio.post(endPoint, data: params);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkSuccessResponse(response.data);
      } else {
        return NetworkErrorResponse("${response.statusMessage}");
      }
    } on DioException catch (e) {
      return NetworkErrorResponse(DioConfig.catchError(e));
    }
  }

  // GET request config
  Future getRequest({required String endPoint}) async {
    try {
      Dio dio = DioConfig.createRequest();

      // send get request given url
      Response response = await dio.get(endPoint);
      if (response.statusCode == 200) {
        return NetworkSuccessResponse(response.data);
      } else {
        return NetworkErrorResponse("${response.statusMessage}");
      }
    } on DioException catch (e) {
      return NetworkErrorResponse(DioConfig.catchError(e));
    }
  }
}
