import 'package:fakestore/bloc/home/home_states.dart';
import 'package:fakestore/core/widgets/loading_widget.dart';
import 'package:fakestore/view/home/tab_bodies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Fake Store'),
            bottom: TabBar(
                isScrollable: true,
                controller: controller,
                tabs: const <Tab>[
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Electronics',
                  ),
                  Tab(
                    text: 'Jewelery',
                  ),
                  Tab(
                    text: "Men's clothing",
                  ),
                  Tab(
                    text: "Woman's clothing",
                  ),
                ]),
          ),
          body: Builder(
            builder: (context) {
              if (state is HomeLoadingState) {
                return const LoadingWidget();
              } 
              else if (state is HomeSuccessState) {
                return TabBarView(controller: controller, children: <Widget>[
                  TabBodyWidget(productsList: state.allData),
                  TabBodyWidget(productsList: state.electronic),
                  TabBodyWidget(productsList: state.jewelery),
                  TabBodyWidget(productsList: state.menClothes),
                  TabBodyWidget(productsList: state.womanClothes)
                ]);
              } 
              else if (state is HomeErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const LoadingWidget();
              }
            },
          )),
    );
  }
}
