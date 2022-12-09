import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/deviders/AppConfigProvider.dart';

import '../my_theme.dart';

class LanguageBottomSheet extends StatefulWidget{
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.ChangeLocale('en');
            },
              child: provider.appLocale == 'en'?
              getSelectedWidget(AppLocalizations.of(context)!.en):
              getUnSelectedWidget(AppLocalizations.of(context)!.en)
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: (){
              provider.ChangeLocale('ar');
            },
              child: provider.appLocale == 'ar'?
              getSelectedWidget(AppLocalizations.of(context)!.ar):
              getUnSelectedWidget(AppLocalizations.of(context)!.ar)
          )
        ],
      ),
    );
  }

  Widget getSelectedWidget(String lang){
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(lang, style: Theme.of(context).textTheme.subtitle2),
            Icon(Icons.check, size: 18, color: MyTheme.primaryLight,)
          ],
        )
    );
  }

  Widget getUnSelectedWidget(String lang){
    return Text(lang, style: Theme.of(context).textTheme.subtitle1);
  }
}