import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/AppConfigProvider.dart';
import 'package:todo_app/setting/theme_bottom_sheet.dart';

import '../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_bottom_sheet.dart';

class SettingTab extends StatelessWidget {
  static const String routeName = 'setting_tab';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          Container(
            color: MyTheme.primaryLight,
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // color: MyTheme.whiteColor,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: MyTheme.primaryLight, width: 2)),
                  child: InkWell(
                    onTap: () {
                      showLanguageBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appLocale == 'en'
                              ? AppLocalizations.of(context)!.en
                              : AppLocalizations.of(context)!.ar,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: MyTheme.primaryLight,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // color: MyTheme.whiteColor,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: MyTheme.primaryLight, width: 2)),
                  child: InkWell(
                    onTap: (){
                      showThemeBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(provider.appMode == ThemeMode.light ?
                          AppLocalizations.of(context)!.light :
                        AppLocalizations.of(context)!.dark,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: MyTheme.primaryLight,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
