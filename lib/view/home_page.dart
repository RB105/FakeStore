import 'package:fakestore/bloc/home_states.dart';
import 'package:fakestore/core/widgets/loading_widget.dart';
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
    controller = TabController(
        length: context.watch<HomeCubit>().categories.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Fake Store'),
          bottom: TabBar(
              tabs: context
                  .watch<HomeCubit>()
                  .categories
                  .asMap()
                  .entries
                  .map((e) {
            if (e.key == 0) {
              return const Tab(
                text: 'All',
              );
            } else {
              return Tab(
                text: e.value,
              );
            }
          }).toList()),
        ),
        body: Builder(
          builder: (context) {
            if (state is HomeLoadingState) {
              return const LoadingWidget();
            } else if (state is HomeErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is HomeSuccessState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.data[index].title ?? ""),
                    ),
                  );
                },
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
