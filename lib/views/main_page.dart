import 'package:flutter/material.dart';
import 'package:instafood_app/core/providers/page_providers.dart';
import 'package:instafood_app/views/home/home.dart';
import 'package:instafood_app/views/widgets/navbar.dart';
import 'package:provider/provider.dart';

import 'base.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, PageProvider page, Widget? child) {
      return Base(
        child: Stack(
          children: [
            pages[page.p],
            Navbar(),
          ],
        ),
      );
    });
  }
}

List<Widget> pages = [const Home()];
