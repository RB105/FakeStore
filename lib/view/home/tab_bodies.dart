import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:fakestore/schema/products_schema.dart';
import 'package:flutter/material.dart';

class TabBodyWidget extends StatelessWidget {
  final List<ProductSchema> productsList;
  const TabBodyWidget({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
          child: Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            height: context.height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage(productsList[index].image ?? ""),
                              fit: BoxFit.contain)),
                    )),
                Expanded(
                    flex: 2,
                    child: ListTile(
                      
                      title: Text(productsList[index].title ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,),
                      subtitle: Text(
                          "Rating: ${productsList[index].rating?.rate ?? 0} (${productsList[index].rating?.count} rates)"),
                      trailing: Text("﹩${productsList[index].price}"),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
