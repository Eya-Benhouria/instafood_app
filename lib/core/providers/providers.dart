import 'package:instafood_app/core/providers/page_providers.dart';
import 'package:instafood_app/core/providers/setting_page_providers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'onboard_providers.dart';
import 'theme_provider.dart';

class AppProviders {
  static AppProviders? _instance;
  static AppProviders? get instance {
    _instance ??= AppProviders._init();
    return _instance;
  }

  AppProviders._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => OnboardProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SettingPageProvider(),
    ),
  ];
}
