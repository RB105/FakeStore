// ignore_for_file: body_might_complete_normally_nullable

import 'package:fakestore/core/config/network_config.dart';
import 'package:fakestore/core/config/requests_config.dart';
import 'package:fakestore/core/constants/project_urls.dart';
import 'package:fakestore/schema/cart/carts_schema.dart';

class AdminPanelService with DioRequestConfig {
  // get All Cart
  Future<NetworkResponse?> getAllUserCarts() async {
    NetworkResponse response = await getRequest(endPoint: ProjectUrls.allCarts);

    if (response is NetworkSuccessResponse) {
      var data = (response.data as List).map((e) => CartsSchema.fromJson(e)).toList();
      return NetworkSuccessResponse(data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
  }
}
