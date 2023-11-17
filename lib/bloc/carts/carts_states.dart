import 'package:bloc/bloc.dart';
import 'package:fakestore/db/carts_database.dart';
import 'package:fakestore/schema/products_schema.dart';

part 'carts_bloc.dart';

abstract class CartStates {
  CartStates();
}

class CartEmtpyState extends CartStates {
  CartEmtpyState();
}

class CartFilledState extends CartStates {
  List<ProductSchema> products;
  CartFilledState({required this.products});
}

class CartInitState extends CartStates {
  CartInitState();
}
