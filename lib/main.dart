
import 'package:fakestore/bloc/carts/carts_states.dart';
import 'package:fakestore/bloc/home/home_states.dart';
import 'package:fakestore/view/screens/current_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomeCubit(), // home page logic
    ),
    BlocProvider(create: (context) => CartCubit(),)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrentScreen(),
    );
  }
}
