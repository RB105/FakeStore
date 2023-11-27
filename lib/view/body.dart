import 'package:fakestore/core/widgets/loading_widget.dart';
import 'package:fakestore/schema/products_schema.dart';
import 'package:fakestore/service/category.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget{
  final String url;
  const MyWidget({super.key, required this.url});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>  with AutomaticKeepAliveClientMixin{
   @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: CategoriesService().getDataByCategory(url: '/products/category/${widget.url}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        } else if (snapshot.data is String) {
          return Center(
            child: Text(snapshot.data),
          );
        } else {
          List<ProductSchema> data = (snapshot.data as List)
              .map((e) => ProductSchema.fromJson(e))
              .toList();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => ListTile(title: Text(data[index].title.toString())),
          );
        }
      },
    );
  }
}
