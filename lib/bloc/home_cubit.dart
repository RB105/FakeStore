part of 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState()) {
    getAllProducts();
  }

  // instance
  ProductsService productsService = ProductsService();

  // variables
  List<String> categories = [];
  List<ProductSchema> electronic = [];
  List<ProductSchema> jewelery = [];
  List<ProductSchema> menClothes = [];
  List<ProductSchema> womanClothes = [];

  // get all products
  Future<void> getAllProducts() async {
    emit(HomeLoadingState());
    NetworkResponse? response = await productsService.getAllProducts();
    await getElectronic();
    await getJewelery();
    await getMenClothes();
    await getWomanClothes();
    if (response is NetworkSuccessResponse) {
      emit(HomeSuccessState(
          allData: response.data,
          electronic: electronic,
          jewelery: jewelery,
          menClothes: menClothes,
          womanClothes: womanClothes));
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }

  Future<void> getElectronic() async {
    NetworkResponse? response = await productsService.getElectronics();
    if (response is NetworkSuccessResponse) {
      electronic = response.data;
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }

  Future<void> getJewelery() async {
    NetworkResponse? response = await productsService.getJewelery();
    if (response is NetworkSuccessResponse) {
      jewelery = response.data;
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }

  Future<void> getMenClothes() async {
    NetworkResponse? response = await productsService.getMenClothes();
    if (response is NetworkSuccessResponse) {
      menClothes = response.data;
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }

  Future<void> getWomanClothes() async {
    NetworkResponse? response = await productsService.getWomanClothes();
    if (response is NetworkSuccessResponse) {
      womanClothes = response.data;
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }

  // get categories
  Future<void> getCategories() async {
    NetworkResponse? response = await productsService.getCategories();
    if (response is NetworkSuccessResponse) {
      categories = (response.data as List).map((e) => e.toString()).toList();
    } else if (response is NetworkErrorResponse) {
      emit(HomeErrorState(response.error));
    }
  }
}
