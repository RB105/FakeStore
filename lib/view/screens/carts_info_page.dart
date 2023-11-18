import 'package:fakestore/bloc/carts/carts_states.dart';
import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:fakestore/schema/product/products_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartInfoPage extends StatefulWidget {
  final ProductSchema product;
  const CartInfoPage({super.key, required this.product});

  @override
  State<CartInfoPage> createState() => _CartInfoPageState();
}

class _CartInfoPageState extends State<CartInfoPage> {
  bool isDeleted = false;
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
      floatingActionButton: SizedBox(
          width: context.width * 0.3,
          child: Visibility(
            visible: !isDeleted,
            child: BlocBuilder<CartCubit, CartStates>(
              builder: (context, state) => ElevatedButton(
                  onPressed: () async {
                    await context
                        .read<CartCubit>()
                        .deleteById(widget.product.i);

                    setState(() {
                      isDeleted = true;
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Remove'),
                      Icon(Icons.remove_shopping_cart_outlined)
                    ],
                  )),
            ),
          )),
    );
  }
}
