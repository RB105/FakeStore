import 'package:fakestore/bloc/carts/carts_states.dart';
import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:fakestore/core/widgets/horizontal_padding.dart';
import 'package:fakestore/schema/products_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatelessWidget {
  final ProductSchema product;
  const InfoPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.cyan),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: context.height * 0.4,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(product.image ?? ""))),
          ),
          ListTile(
            isThreeLine: true,
            title: Text(product.title ?? ""),
            subtitle: Text(
                "Rating:${product.rating?.rate ?? ""}\n${product.rating?.count ?? ""} votes"),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: context.height * 0.05,
        width: double.infinity,
        child: ProjectHorizontalPadding(
            child: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) => ElevatedButton(
              onPressed: () async {
                await context.read<CartCubit>().addToCart(product: product);
              },
              child: const Text('Add to cart')),
        )),
      ),
    );
  }
}
