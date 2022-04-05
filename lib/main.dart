import 'package:flutter/material.dart';
import 'package:instafood_app/views/views_shelf.dart';
import 'package:provider/provider.dart';
import 'core/core_shelf.dart' as core;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await core.LocalManager.prefrencesInit();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [...?core.AppProviders.instance?.dependItems],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, core.ThemeProvider theme, Widget? child) {
      return MaterialApp(
        title: 'Insta_Food',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Onboarding(),
      );
    });
  }
}
