import 'package:fakestore/core/config/network_config.dart';
import 'package:fakestore/core/config/requests_config.dart';

class CategoriesService with DioRequestConfig {
  // get categories
  Future<NetworkResponse?> getCategories() async {
    NetworkResponse response = await getRequest(
        endPoint: 'https://fakestoreapi.com/products/categories');
    if (response is NetworkSuccessResponse) {
      var data = (response.data as List).map((e) => e.toString()).toList();
      return NetworkSuccessResponse(data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
    return null;
  }

  Future getDataByCategory({required String url}) async {
    NetworkResponse response = await getRequest(endPoint: url);

    if (response is NetworkSuccessResponse) {
      return response.data;
    } else if (response is NetworkErrorResponse) {
      return response.error;
    }
  }
}
