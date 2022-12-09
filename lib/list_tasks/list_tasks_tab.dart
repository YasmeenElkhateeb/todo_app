import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import '../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListTasksTab extends StatelessWidget{
  static const String routeName ='list_tasks_tab';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: MyTheme.primaryLight,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  onDateSelected: (date) => print(date),
                  leftMargin: 20,
                  monthColor: MyTheme.whiteColor,
                  dayColor: MyTheme.blackLight,
                  activeDayColor: MyTheme.primaryLight,
                  activeBackgroundDayColor: MyTheme.whiteColor,
                  dotsColor: MyTheme.primaryLight,
                  selectableDayPredicate: (date) => true,
                  locale: 'en_ISO',
                ),
              ),

              
            ],
          )

        ],
      ),
    );
  }

}