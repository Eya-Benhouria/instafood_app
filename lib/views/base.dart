import 'package:flutter/material.dart';
import 'package:instafood_app/core/core_shelf.dart';

class Base extends StatelessWidget {
  const Base({
    Key? key,
    required this.child,
    this.bgColor,
  }) : super(key: key);
  final Color? bgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: w(context),
        height: h(context),
        color: bgColor ?? AppColors.white,
        child: child,
      ),
    );
  }
}
