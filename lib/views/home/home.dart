import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instafood_app/core/core_shelf.dart';
import 'package:instafood_app/core/extensions/image_path.extentions.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: hh(context, 50)),
            horizontalpadding(
              context,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: bigBody(context, textPrimary(context)),
                      children: [
                        TextSpan(
                          text: "Hello, ",
                        ),
                        TextSpan(
                          text: "John",
                          style: bigBody(context, AppColors.primary),
                        ),
                        TextSpan(
                          text: "!",
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "HOME",
                        style: label(context, AppColors.primary),
                      ),
                      SizedBox(width: ww(context, 5)),
                      SvgPicture.asset(
                        "Location".toIcon,
                        width: ww(context, 22),
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
