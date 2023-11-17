import 'package:fakestore/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class ProjectHorizontalPadding extends StatelessWidget {
  final Widget child;
  const ProjectHorizontalPadding({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  context.width * 0.02), child: child, ); } }