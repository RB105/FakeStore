
import 'package:fakestore/schema/products_schema.dart';

extension ProductsList on List<ProductSchema> {
  List<ProductSchema> removeDuplicates() {
    List<ProductSchema> result = [];
    for (var i = 0; i < length; i++) {
      if (!result.contains(this[i])) {
        result.add(this[i]);
      }
    }
    return result;
  }
}
