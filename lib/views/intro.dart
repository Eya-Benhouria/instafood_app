import 'package:flutter/material.dart';
import 'package:instafood_app/core/core_shelf.dart';
import 'package:instafood_app/core/extensions/image_path.extentions.dart';
import 'package:instafood_app/core/providers/onboard_providers.dart';
import 'package:instafood_app/views/views_shelf.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, OnboardProvider state, Widget? child) {
        var item = onboardPages(context)[state.page];

        return Container(
          width: w(context),
          height: h(context),
          child: Stack(
            children: [
              Container(
                width: w(context),
                height: h(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              horizontalpadding(
                context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: hh(context, 50)),
                    logo(
                      context,
                      foodStyle: head18(context, AppColors.white, key),
                      eStyle: head18(context, AppColors.food, key),
                    ),
                    const Spacer(),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 1240),
                      child: item.title,
                    ),
                    Text(
                      item.message,
                      style: body(context, AppColors.white),
                    ),
                    SizedBox(height: hh(context, 50)),
                    SolidBorderedButton(
                      onTap: () {
                        if (state.page < 2) {
                          state.changePage(state.page + 1);
                        } else {
                          replaceTo(context, GetStarted());
                        }
                      },
                      text: state.page == 2 ? "COMMENCER" : "SUIVANT",
                      bgColor: AppColors.primary,
                      borderColor: AppColors.primary,
                      textColor: AppColors.white,
                    ),
                    SizedBox(height: hh(context, 50)),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(item.imgPath.toImgPng), fit: BoxFit.cover),
          ),
        );
      }),
    );
  }
}

class OnboardingModel {
  final int id;
  final String imgPath;
  final Widget title;
  final String message;

  OnboardingModel(this.id, this.imgPath, this.title, this.message);
}

List<OnboardingModel> onboardPages(BuildContext context) => [
      OnboardingModel(
        0,
        "ob0",
        Container(
          width: ww(context, 222),
          child: RichText(
            text: TextSpan(
              style: head36(context, AppColors.white),
              children: [
                const TextSpan(
                  text: "DECOUVRIR ",
                ),
                TextSpan(
                  text: "NOS ",
                ),
                TextSpan(
                  text: "PLASTS ",
                  style: head36(context, AppColors.food),
                ),
              ],
            ),
          ),
        ),
        "Choisissez votre plats préférés!",
      ),
      OnboardingModel(
        1,
        "ob2",
        Container(
          width: ww(context, 230),
          child: RichText(
            text: TextSpan(
              style: head36(context, AppColors.white),
              children: [
                const TextSpan(
                  text: "PASSER ",
                ),
                const TextSpan(
                  text: "VOS ",
                ),
                TextSpan(
                  text: "COMMANDES ",
                  style: head36(context, AppColors.food),
                ),
              ],
            ),
          ),
        ),
        "Commandez facilement vos plats préférés!",
      ),
      OnboardingModel(
        2,
        "ob1",
        Container(
          width: ww(context, 222),
          child: RichText(
            text: TextSpan(
              style: head36(context, AppColors.white),
              children: [
                const TextSpan(
                  text: "DECOUVRIR ",
                ),
                const TextSpan(
                  text: "NOS ",
                ),
                TextSpan(
                  text: "OFFRES ",
                  style: head36(context, AppColors.food),
                ),
              ],
            ),
          ),
        ),
        "Vos plats préférés livrés chez vous!",
      ),
    ];
