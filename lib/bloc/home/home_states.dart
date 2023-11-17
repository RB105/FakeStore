import 'package:bloc/bloc.dart';
import 'package:fakestore/core/config/network_config.dart';
import 'package:fakestore/schema/products_schema.dart';
import 'package:fakestore/service/products_service.dart';
part 'home_cubit.dart';

abstract class HomeStates {
  HomeStates();
}

class HomeInitState extends HomeStates {
  HomeInitState();
}

class HomeSuccessState extends HomeStates {
  List<ProductSchema> allData;
  List<ProductSchema> electronic;
  List<ProductSchema> jewelery;
  List<ProductSchema> menClothes;
  List<ProductSchema> womanClothes;
  HomeSuccessState(
      {required this.allData,
      required this.electronic,
      required this.jewelery,
      required this.menClothes,
      required this.womanClothes});
}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState(this.error);
}

class HomeLoadingState extends HomeStates {
  HomeLoadingState();
}
