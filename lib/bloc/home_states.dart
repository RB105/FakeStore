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
  List<ProductSchema> data;
  HomeSuccessState(this.data);
}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState(this.error);
}

class HomeLoadingState extends HomeStates {
  HomeLoadingState();
}
