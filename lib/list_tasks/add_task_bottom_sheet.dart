import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

import '../firebase_utils.dart';
import '../my_theme.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();

  String title = '';
  String description ='';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Task Title'),
                    onChanged: (text){
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Plese Enter Your Title Task";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: 'Enter Task Description'),
                    onChanged: (text){
                      description = text;
                    },
                    maxLines: 4,
                    minLines: 4,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Plese Enter Your description Task";
                      }
                      return null;
                    },
                  )
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Text('Select Date'),
          SizedBox(
            height: 15,
          ),
          Container(
            // color: MyTheme.whiteColor,
            padding: EdgeInsets.all(15),
            // decoration: BoxDecoration(
            //     border:
            //     Border.all(color: MyTheme.primaryLight, width: 2)),
            child: InkWell(
              onTap: () {
                chosenDate();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // '14/11/2022',
                    // '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                  '${formatDate(selectedDate, [mm, '/', dd, '/', yyyy])}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: MyTheme.primaryLight,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  Task task =Task(
                      title: title,
                      description: description,
                      date: selectedDate.microsecondsSinceEpoch
                  );
                  addTaskToFireStore(task)
                      .timeout(
                        Duration(milliseconds: 500),
                        onTimeout:(){
                          print('task was added');
                          Navigator.pop(context);
                        }
                      );

                }
              },
              child: Text('Add'))
        ],
      ),
    );
  }

  void chosenDate() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
