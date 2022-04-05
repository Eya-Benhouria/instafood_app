import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instafood_app/core/core_shelf.dart';
import 'package:instafood_app/views/views_shelf.dart';
import 'package:instafood_app/views/auth/connexion.dart';
import 'package:instafood_app/views/home/home.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: w(context),
        height: h(context),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/splashIcon.png"), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: w20(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: hh(context, 50)),
            logo(
              context,
              foodStyle: head18(context, AppColors.dark, key),
              eStyle: head18(context, AppColors.food, key),
            ),
            SizedBox(height: hh(context, 60)),
            RichText(
              text: TextSpan(
                style: head36(context, textPrimary(context)),
                children: [
                  TextSpan(
                    text: "C'EST ",
                    style: head36(context, AppColors.food),
                  ),
                  TextSpan(
                    text: "PARTI !",
                    style: head36(
                      context,
                      AppColors.food,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: hh(context, 40)),
            Text(
              "Dégustez des plats délicieux et profitez des meilleurs offres en quelques cliques",
              style: titleMedium14(context, AppColors.food),
            ),
            const Spacer(),
            SolidBorderedButton(
              text: "J'ai déja un compte",
              bgColor: AppColors.primary,
              borderColor: AppColors.primary,
              textColor: AppColors.white,
              onTap: () => pushTo(context, LoginPage()),
            ),
            SizedBox(height: hh(context, 30)),
            SolidBorderedButton(
              onTap: () => pushTo(context, const Home()),
              text: "COMMENCER",
              bgColor: AppColors.white,
              borderColor: AppColors.primary,
              textColor: AppColors.primary,
            ),
            SizedBox(height: hh(context, 50)),
          ],
        ),
      ),
    );
  }
}
