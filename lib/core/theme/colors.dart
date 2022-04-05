import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core_shelf.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color light = Color(0xfff4f4f4);
  static const Color grey = Color(0xffa3a3a3);
  static const Color darkGrey = Color(0xff414141);
  static const Color dark = Color(0xff2d2d2d);
  static const Color food = Color(0xffBCCC00);
  static const Color primary = Color(0xffFEA30F);
  static const Color jaune = Color(0xffefd807);
}

ThemeProvider themeProvider(BuildContext context) =>
    Provider.of<ThemeProvider>(context, listen: false);

Color bgPrimary(BuildContext context) =>
    themeProvider(context).isDark ? AppColors.dark : AppColors.white;

Color bgSecondary(BuildContext context) =>
    themeProvider(context).isDark ? AppColors.darkGrey : AppColors.light;

Color textPrimary(BuildContext context) =>
    themeProvider(context).isDark ? AppColors.white : AppColors.dark;

Color textSecondary = AppColors.grey;
