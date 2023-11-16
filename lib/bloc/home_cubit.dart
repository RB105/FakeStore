part of 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState()) {
    getAllProducts();
  }

  // instance
  ProductsService productsService = ProductsService();

  // variables
  List<String> categories = [];

  // get all products
  Future<void> getAllProducts() async {
    emit(HomeLoadingState());
    await getCategories();
    NetworkResponse? response = await productsService.getAllProducts();
    if (response is NetworkSuccessResponse) {
      emit(HomeSuccessState(response.data));
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }

  // get categories
  Future<void> getCategories() async {
    emit(HomeLoadingState());
    NetworkResponse? response = await productsService.getCategories();
    if (response is NetworkSuccessResponse) {
      categories = response.data;
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }
}
