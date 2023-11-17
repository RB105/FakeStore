// ignore_for_file: body_might_complete_normally_nullable

import 'package:fakestore/core/config/network_config.dart';
import 'package:fakestore/core/config/requests_config.dart';
import 'package:fakestore/core/constants/project_urls.dart';
import 'package:fakestore/schema/products_schema.dart';

class ProductsService with DioRequestConfig {
  // get all products
  Future<NetworkResponse?> getAllProducts() async {
    NetworkResponse response = await getRequest(endPoint: ProjectUrls.getAll);

    if (response is NetworkSuccessResponse) {
      // success data
      List<ProductSchema> data = (response.data as List)
          .map((e) => ProductSchema.fromJson(e))
          .toList(); // schema
      return NetworkSuccessResponse(data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
  }

  // get electronics
  Future<NetworkResponse?> getElectronics() async {
    NetworkResponse response =
        await getRequest(endPoint: ProjectUrls.electronics);

    if (response is NetworkSuccessResponse) {
      List<ProductSchema> data = (response.data as List)
          .map((e) => ProductSchema.fromJson(e))
          .toList();
      return NetworkSuccessResponse(data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
  }

  // get jewelery
  Future<NetworkResponse?> getJewelery() async {
    NetworkResponse response = await getRequest(endPoint: ProjectUrls.jewelery);

    if (response is NetworkSuccessResponse) {
      List<ProductSchema> data = (response.data as List)
          .map((e) => ProductSchema.fromJson(e))
          .toList();
      return NetworkSuccessResponse(data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
  }

  // get men clothes
  Future<NetworkResponse?> getMenClothes() async {
    NetworkResponse response =
        await getRequest(endPoint: ProjectUrls.menClothing);

    if (response is NetworkSuccessResponse) {
      List<ProductSchema> data = (response.data as List)
          .map((e) => ProductSchema.fromJson(e))
          .toList();
      return NetworkSuccessResponse(data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
  }

  // get woman clothes
  Future<NetworkResponse?> getWomanClothes() async {
    NetworkResponse response =
        await getRequest(endPoint: ProjectUrls.womenClothing);

    if (response is NetworkSuccessResponse) {
      List<ProductSchema> data = (response.data as List)
          .map((e) => ProductSchema.fromJson(e))
          .toList();
      return NetworkSuccessResponse(data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
  }

  // get categories
  Future<NetworkResponse?> getCategories() async {
    NetworkResponse response =
        await getRequest(endPoint: ProjectUrls.categories);

    if (response is NetworkSuccessResponse) {
      return NetworkSuccessResponse(response.data);
    } else if (response is NetworkErrorResponse) {
      return NetworkErrorResponse(response.error);
    }
  }
}
