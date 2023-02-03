import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/list_tasks/item_task.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/providers/AppConfigProvider.dart';

import '../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:select_dialog/select_dialog.dart';
// import 'edit_task.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'edit_task.dart';


class ListTasksTab extends StatefulWidget{
  static const String routeName ='list_tasks_tab';

  @override
  State<ListTasksTab> createState() => _ListTasksTabState();
}

class _ListTasksTabState extends State<ListTasksTab> {
  // List<Task> taskList = [];
  // DateTime selectedDate = DateTime.now();

  var editFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    provider.getAllTaskFromFirebaseStore();
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
                  initialDate: provider.selectedDate, // to when select date get task in this date
                  // initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  onDateSelected: (date) {
                    provider.changeSelectedDate(date);
                  },
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
          ),
          // ElevatedButton(onPressed: (){
          //   Navigator.of(context).pushNamed(EditTask.routeName
          //       ,arguments:taskList,
          //   );
          //   // alertSheet();
          // }, child: Text('popup sheet')),
          Expanded(
            child: ListView.builder(
                itemBuilder:(context,index){
                  return ItemTask(task: provider.taskList[index]);
                } ,
            itemCount: provider.taskList.length,),
          )

        ],
      ),
    );
  }

  // getAllTaskFromFirebaseStore() async{
  //   QuerySnapshot<Task>  querySnapshot =await getTaskCollection().get(); // get all data from firebase local
  //   taskList = querySnapshot.docs.map((doc) {
  //     return doc.data();
  //   }).toList();
  //
  //
  //   /// todo filtter by date
  //   taskList = taskList.where((task){
  //     DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(task.date);
  //     if(dateTime.day == selectedDate.day &&
  //     dateTime.month == selectedDate.month &&
  //     dateTime.year == selectedDate.year){
  //       return true;
  //     }
  //     return false;
  //   }).toList();
  //
  //   /// todo sort
  //   taskList.sort((Task task1,Task task2){
  //     DateTime dateTime1 = DateTime.fromMicrosecondsSinceEpoch(task1.date);
  //     DateTime dateTime2 = DateTime.fromMicrosecondsSinceEpoch(task2.date);
  //     print(dateTime1);
  //     print(dateTime2);
  //     return dateTime1.compareTo(dateTime2);
  //   });
  //
  //   setState(() {
  //
  //   });
  // }

  // alertSheet(){
  //   return Alert(
  //       context: context,
  //       title: "Edit Task",
  //       content: Column(
  //         children: <Widget>[
  //           Form(
  //               key: editFormKey,
  //               child: Column(
  //                 children: [
  //                   TextFormField(
  //                     decoration: InputDecoration(hintText: 'Enter Task Title'),
  //                     onChanged: (text){
  //                       // title = text;
  //                     },
  //                     validator: (text) {
  //                       if (text == null || text.isEmpty) {
  //                         return "Plese Enter Your Title Task";
  //                       }
  //                       return null;
  //                     },
  //                   ),
  //                   SizedBox(
  //                     height: 15,
  //                   ),
  //                   TextFormField(
  //                     decoration:
  //                     InputDecoration(hintText: 'Enter Task Description'),
  //                     onChanged: (text){
  //                       // description = text;
  //                     },
  //                     maxLines: 4,
  //                     minLines: 4,
  //                     validator: (text) {
  //                       if (text == null || text.isEmpty) {
  //                         return "Plese Enter Your description Task";
  //                       }
  //                       return null;
  //                     },
  //                   )
  //                 ],
  //               )),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           Text('Select Date'),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           Container(
  //             // color: MyTheme.whiteColor,
  //             padding: EdgeInsets.all(15),
  //             // decoration: BoxDecoration(
  //             //     border:
  //             //     Border.all(color: MyTheme.primaryLight, width: 2)),
  //             child: InkWell(
  //               onTap: () {
  //                 chosenDate();
  //               },
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     // '14/11/2022',
  //                     '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
  //                     style: Theme.of(context).textTheme.subtitle2,
  //                   ),
  //                   Icon(
  //                     Icons.arrow_drop_down,
  //                     color: MyTheme.primaryLight,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //
  //       buttons: [
  //         DialogButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text(
  //             "Save Changes",
  //             style: TextStyle(color: Colors.white, fontSize: 20),
  //           ),
  //         )
  //       ]).show();
  // }
  // void chosenDate() async {
  //   var chosenDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(Duration(days: 365)),
  //   );
  //   if (chosenDate != null) {
  //     selectedDate = chosenDate;
  //     setState(() {});
  //   }
  // }
}

