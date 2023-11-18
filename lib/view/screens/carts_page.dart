import 'package:fakestore/bloc/carts/carts_states.dart';
import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:fakestore/view/screens/carts_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(state is CartFilledState
              ? '${state.products.length} products'
              : 'Cart'),
        ),
        body: Builder(
          builder: (context) {
            if (state is CartEmtpyState) {
              return const Center(
                child: Text("Cart is empty"),
              );
            } else if (state is CartFilledState) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.01),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CartInfoPage(product: state.products[index],index: index),
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
                                  tag: "cart$index",
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                state.products[index].image ??
                                                    ""),
                                            fit: BoxFit.contain)),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text(
                                    state.products[index].title ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                      "Rating: ${state.products[index].rating?.rate?.toStringAsFixed(1) ?? ""} (${state.products[index].rating?.count ?? ""} rates)"),
                                  trailing: Text(
                                      "﹩${state.products[index].price?.toStringAsFixed(1) ?? ""}"),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
