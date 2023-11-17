import 'dart:io';
import 'package:fakestore/schema/products_schema.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class CartsLocalDB {
  late Isar isar;

  Future<Object> getCartProducts() async {
    await openDB();
    final products = await isar.productSchemas.where().findAll();
    if (products.isEmpty) {
      await isar.close();
      return 'Empty';
    } else {
      await isar.close();
      return products;
    }
  }

  // opens database
  Future<void> openDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    isar = await Isar.open(<CollectionSchema>[ProductSchemaSchema],
        directory: directory.path);
  }

  // add item 2 datase
  Future<void> addDB(ProductSchema product) async {
    await openDB();
    await isar.writeTxn(() async {
      await isar.productSchemas.put(product);
    });
    await isar.close();
  }
}
