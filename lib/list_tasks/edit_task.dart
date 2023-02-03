import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/AppConfigProvider.dart';

import '../firebase_utils.dart';
import '../model/task.dart';
import '../my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTask extends StatefulWidget {
  static const String routeName = 'edit_task';

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var formKey = GlobalKey<FormState>();

  // String title = '';
  // String description = '';
  var titleController =TextEditingController();
  var descriptionController =TextEditingController();
  DateTime selectedDate = DateTime.now();
late Task task;

  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 10)); // مش احسن حل
    WidgetsBinding.instance.addPostFrameCallback((_) {  // call function one time after build context
      // الطريقة دى لازالت لم تحل المشكلة ولكنها حلت مشكلة ال date
      // ولذلك نحلها ب controller
      task = ModalRoute.of(context)?.settings.arguments as Task;
      titleController.text = task.title;
      descriptionController.text =task.description;
      selectedDate = DateTime.fromMicrosecondsSinceEpoch(task.date);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var task = ModalRoute.of(context)?.settings.arguments as Task;
    // title = task.title;
    // description =task.description;
    // selectedDate = DateTime.fromMicrosecondsSinceEpoch(task.date); //مش احسن مكان
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppLocalizations.of(context)!.todolist,
            style: Theme.of(context).textTheme.headline1,
          ),
        )),
        body: Stack(
          children: [
            Container(
              color: MyTheme.primaryLight,
              height: screenSize.height * 0.1,
            ),
            Container(
              height: screenSize.height * 0.7,
              // width: screenSize.width*0.8,
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                color: MyTheme.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Edit Task',
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
                          decoration: InputDecoration(hintText: 'title'),
                          // onChanged: (text) {
                          //   title = text;
                          // },
                          // initialValue: title,
                          controller: titleController,
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
                          decoration: InputDecoration(
                              hintText: 'Enter Task Description'),
                          // onChanged: (text) {
                          //   description = text;
                          // },
                          // initialValue: description,
                          controller: descriptionController,
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
                    ),
                  ),
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
                            '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
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
                              task.title= titleController.text;
                              task.description= descriptionController.text;
                              task.date= selectedDate.microsecondsSinceEpoch;
                          Provider.of<AppConfigProvider>(context,listen: false).editTask(task);
                        }
                        Navigator.of(context).pop();
                        //   editTaskToFireStore(task).timeout(
                        //       Duration(milliseconds: 500), onTimeout: () {
                        //     print('task was Edit');
                        //     Navigator.pop(context);
                        //   });
                          print('task was Edit');
                        // }
                      },
                      child: Text('Edit Task'))
                ],
              ),
            ),
          ],
        ));
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
