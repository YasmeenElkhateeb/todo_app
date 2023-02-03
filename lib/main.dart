import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/providers/AppConfigProvider.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/setting/setting_tab.dart';

import 'list_tasks/edit_task.dart';
import 'list_tasks/list_tasks_tab.dart';
import 'my_theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork(); // local storage work offline
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
        EditTask.routeName: (context) => EditTask(),
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
