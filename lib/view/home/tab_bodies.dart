import 'package:fakestore/bloc/home/home_states.dart';
import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:fakestore/schema/product/products_schema.dart';
import 'package:fakestore/view/home/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBodyWidget extends StatelessWidget {
  final List<ProductSchema> productsList;
  const TabBodyWidget({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().getAllProducts(),
      child: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InfoPage(product: productsList[index],index: index),
                ));
              },
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
                        child: Hero(
                          tag: '$index',
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        productsList[index].image ?? ""),
                                    fit: BoxFit.contain)),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                            productsList[index].title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                              "Rating: ${productsList[index].rating?.rate?.toStringAsFixed(1)??""} (${productsList[index].rating?.count??""} rates)"),
                          trailing: Text(
                              "﹩${productsList[index].price?.toStringAsFixed(1) ?? ""}"),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
