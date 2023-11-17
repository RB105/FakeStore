import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:fakestore/core/widgets/horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ProjectHorizontalPadding(
          child: Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        height: context.height * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.transparent),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.white10,
              child: Container(
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                height: context.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.white10,
              child: Container(
                margin: const EdgeInsets.all(8),
                height: context.height * 0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
