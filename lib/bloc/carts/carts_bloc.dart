part of 'carts_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState()) {
    getCarts();
  }

  // instance
  CartsLocalDB cartsLocalDB = CartsLocalDB();

  Future<void> getCarts() async {
    var data = await cartsLocalDB.getCartProducts();
    if (data is String) {
      emit(CartEmtpyState());
    } else if (data is List<ProductSchema>) {
      emit(CartFilledState(products: data));
    }
  }

  Future<void> deleteById(Id id) async {
    await cartsLocalDB.deleteById(id);
    await getCarts();
  }

  Future<void> addToCart({required ProductSchema product}) async {
    await cartsLocalDB.addDB(product);
    await getCarts();
  }
}
