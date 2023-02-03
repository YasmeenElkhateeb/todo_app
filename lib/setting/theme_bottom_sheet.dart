import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/AppConfigProvider.dart';

import '../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget{
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
                provider.ChangeTheme(ThemeMode.light);
              },
              child: provider.appMode == ThemeMode.light?
              getSelectedWidget(AppLocalizations.of(context)!.light):
              getUnSelectedWidget(AppLocalizations.of(context)!.light)
          ),
          SizedBox(height: 25,),
          InkWell(
              onTap: (){
                provider.ChangeTheme(ThemeMode.dark);
              },
              child: provider.appMode == ThemeMode.dark ?
              getSelectedWidget(AppLocalizations.of(context)!.dark):
              getUnSelectedWidget(AppLocalizations.of(context)!.dark)
          )
        ],
      ),
    );
  }

  Widget getSelectedWidget(String mode){
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(mode, style: Theme.of(context).textTheme.subtitle2),
            Icon(Icons.check, size: 18, color: MyTheme.primaryLight,)
          ],
        )
    );
  }

  Widget getUnSelectedWidget(String mode){
    return Text(mode, style: Theme.of(context).textTheme.subtitle1);
  }
}