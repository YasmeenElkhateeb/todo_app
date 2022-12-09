import 'package:flutter/material.dart';
import 'package:todo_app/list_tasks/add_task_bottom_sheet.dart';
import 'package:todo_app/list_tasks/list_tasks_tab.dart';
import 'package:todo_app/setting/setting_tab.dart';

import 'my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;
  List<Widget> tabs =[ListTasksTab(),SettingTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          AppLocalizations.of(context)!.todolist,
          style: Theme.of(context).textTheme.headline1,
        ),
      )),
      body: Container(
        child:tabs[selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskSheet(context);
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: MyTheme.whiteColor,
        ),
        backgroundColor: MyTheme.primaryLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            side: BorderSide(color: MyTheme.whiteColor,width: 4)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
            onTap:(index){
              selectedIndex = index;
              setState(() {

              });
            },
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: AppLocalizations.of(context)!.list),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
        ]),
      ),
    );
  }

  void showAddTaskSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddTaskBottomSheet()
    );
  }
}
