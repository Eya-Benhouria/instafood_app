import 'package:flutter/material.dart';
import 'package:instafood_app/core/init/metrics.dart';

TextStyle head36(BuildContext context, Color color) => TextStyle(
      fontFamily: "Bebas",
      fontSize: hh(context, 30),
      color: color,
    );

TextStyle head24(BuildContext context, Color color) => TextStyle(
      fontFamily: "Bebas",
      fontSize: hh(context, 24),
      color: color,
    );

TextStyle head18(BuildContext context, Color color, grey) => TextStyle(
      fontFamily: "Bebas",
      fontSize: hh(context, 18),
      color: color,
    );

TextStyle label(BuildContext context, Color color) => TextStyle(
      fontFamily: "Bebas",
      fontSize: hh(context, 12),
      color: color,
    );

TextStyle body(BuildContext context, Color color) => TextStyle(
      fontSize: hh(context, 14),
      fontWeight: FontWeight.w500,
      color: color,
    );

TextStyle input(BuildContext context, Color color) => TextStyle(
      fontSize: hh(context, 14),
      color: color,
    );

TextStyle bigBody(BuildContext context, Color color) => TextStyle(
      fontSize: hh(context, 18),
      fontWeight: FontWeight.w500,
      color: color,
    );

TextStyle titleMedium(BuildContext context, Color color) => TextStyle(
      fontSize: hh(context, 20),
      fontWeight: FontWeight.w500,
      color: color,
    );

TextStyle titleMedium14(BuildContext context, Color color) => TextStyle(
      fontSize: hh(context, 16),
      fontWeight: FontWeight.w500,
      color: color,
    );
