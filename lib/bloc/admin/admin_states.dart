import 'package:bloc/bloc.dart';
import 'package:fakestore/core/config/network_config.dart';
import 'package:fakestore/schema/cart/carts_schema.dart';
import 'package:fakestore/service/admin_service.dart';

part 'admin_cubit.dart';

abstract class AdminStates {
  AdminStates();
}

class AdminInitState extends AdminStates {
  AdminInitState();
}

class AdminLoadingState extends AdminStates {
  AdminLoadingState();
}

class AdminErrorState extends AdminStates {
  final String error;
  AdminErrorState(this.error);
}

class AdminSuccessState extends AdminStates {
  List<CartsSchema> data;
  AdminSuccessState(this.data);
}
