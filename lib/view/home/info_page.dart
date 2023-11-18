import 'package:fakestore/bloc/carts/carts_states.dart';
import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:fakestore/core/widgets/horizontal_padding.dart';
import 'package:fakestore/schema/product/products_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatefulWidget {
  final ProductSchema product;
  const InfoPage({super.key, required this.product});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.cyan),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: context.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.product.image ?? ""))),
          ),
          ListTile(
            isThreeLine: true,
            title: Text(widget.product.title ?? ""),
            subtitle: Text(
                "Rating: ${widget.product.rating?.rate?.toStringAsFixed(1) ?? ""}\n${widget.product.rating?.count ?? ""} votes"),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: context.height * 0.05,
        width: double.infinity,
        child: ProjectHorizontalPadding(
            child: count > 0
                ? ProjectHorizontalPadding(
                    child: Row(
                      children: [
                        Expanded(child: Text("﹩${widget.product.price! * count}  $count on cart")),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: const Text("+1")),
                            IconButton(
                                onPressed: () {
                                  // navigation
                                },
                                icon: const Icon(
                                    Icons.shopping_cart_checkout_sharp))
                          ],
                        ))
                      ],
                    ),
                  )
                : BlocBuilder<CartCubit, CartStates>(
                    builder: (context, state) => ElevatedButton(
                        onPressed: () async {
                          await context
                              .read<CartCubit>()
                              .addToCart(product: widget.product);
                          setState(() {
                            count++;
                          });
                        },
                        child: const Text('Add to cart')),
                  )),
      ),
    );
  }
}
