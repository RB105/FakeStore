import 'package:fakestore/bloc/carts/carts_states.dart';
import 'package:fakestore/view/home/tab_bodies.dart';
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
              return TabBodyWidget(productsList: state.products);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
