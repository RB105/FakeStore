import 'package:fakestore/bloc/admin/admin_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Admin Panel'),
        ),
        body: Builder(
          builder: (context) {
            if (state is AdminLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AdminErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is AdminSuccessState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                      title: Text("User: ${state.data[index].userId ?? ""}"),
                      subtitle: Text(state.data[index].date ?? ""),
                      children: List.generate(
                          state.data[index].products?.length ?? 0,
                          (int i) => ListTile(
                            title: Text(
                                "${state.data[index].products?[i].productId ?? ""}"),
                            trailing: Text(
                                "${state.data[index].products?[i].quantity ?? ""}"),
                          ),)
                      // [
                      //   ListView.builder(
                      //     itemCount: state.data[index].products?.length ?? 0,
                      //     itemBuilder: (context, int i) => ListTile(
                      //       title: Text(
                      //           "${state.data[index].products?[i].productId ?? ""}"),
                      //       trailing: Text(
                      //           "${state.data[index].products?[i].quantity ?? ""}"),
                      //     ),
                      //   )
                      // ],
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
