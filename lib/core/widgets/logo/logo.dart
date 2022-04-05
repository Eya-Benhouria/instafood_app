import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instafood_app/core/theme/theme_shelf.dart';

Widget logo(BuildContext context, {TextStyle? foodStyle, TextStyle? eStyle}) =>
    RichText(
      text: TextSpan(
        style: foodStyle ?? head36(context, textPrimary(context)),
        children: [
          const TextSpan(
            text: "Insta",
          ),
          TextSpan(
            text: "Food",
            style: eStyle ?? head36(context, AppColors.primary),
          ),
        ],
      ),
    );
