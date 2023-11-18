part of 'admin_states.dart';

class AdminCubit extends Cubit<AdminStates> {
  AdminCubit() : super(AdminInitState()) {
    getAllCarts();
  }

  // instance
  AdminPanelService adminPanelService = AdminPanelService();

  // get All users carts
  Future<void> getAllCarts() async {
    emit(AdminLoadingState());
    NetworkResponse? response = await adminPanelService.getAllUserCarts();
    if (response is NetworkSuccessResponse) {
      emit(AdminSuccessState(response.data));
    } else if (response is NetworkErrorResponse) {
      emit(AdminErrorState(response.error));
    }
  }
}
