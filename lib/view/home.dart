import 'package:fakestore/core/config/network_config.dart';
import 'package:fakestore/core/widgets/loading_widget.dart';
import 'package:fakestore/service/category.dart';
import 'package:fakestore/view/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? tabController;
  String error = '';
  List<String> list = [];
  bool isLoading = false;

  Future<void> getCategories() async {
    isLoading = true;
    setState(() {});
    NetworkResponse? response = await CategoriesService().getCategories();
    if (response is NetworkSuccessResponse) {
      error = '';
      list = response.data;
      tabController = TabController(length: list.length, vsync: this);
    } else if (response is NetworkErrorResponse) {
      error = response.error;
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Categories'),
            bottom: list.isNotEmpty
                ? TabBar(
                  isScrollable: true,
                    controller: tabController,
                    tabs: List.generate(
                        list.length,
                        (index) => Tab(
                              text: list[index],
                            )),
                  )
                : const PreferredSize(
                    preferredSize: Size.fromHeight(10), child: SizedBox())),
        body: Builder(
          builder: (context) {
            if (isLoading) {
              return const LoadingWidget();
            } else if (error.isNotEmpty) {
              return Center(
                child: Text(error),
              );
            } else if (list.isNotEmpty) {
              return TabBarView(
                  controller: tabController,
                  children: List.generate(
                      list.length,
                      (index) => MyWidget(url: list[index])));
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
