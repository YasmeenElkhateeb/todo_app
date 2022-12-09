import 'package:flutter/material.dart';
import 'package:todo_app/deviders/AppConfigProvider.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/setting/setting_tab.dart';

import 'list_tasks/list_tasks_tab.dart';
import 'my_theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => AppConfigProvider(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ListTasksTab.routeName: (context) => ListTasksTab(),
        SettingTab.routeName: (context) => SettingTab(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLocale),
      themeMode: provider.appMode,
    );
  }
}
