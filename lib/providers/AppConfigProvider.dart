import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLocale = 'en';
  ThemeMode appMode =ThemeMode.light;

  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();

  void ChangeLocale(String newLocale){
    if(appLocale == newLocale){
      return;
    }
    appLocale =newLocale;
    notifyListeners();
  }

  void ChangeTheme(ThemeMode newMode){
    if(appMode == newMode){
      return;
    }
    appMode = newMode;
    notifyListeners();
  }

  getAllTaskFromFirebaseStore() async{
    QuerySnapshot<Task>  querySnapshot =await getTaskCollection().get(); // get all data from firebase local
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();


    /// todo filtter by date
    taskList = taskList.where((task){
      DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(task.date);
      if(dateTime.day == selectedDate.day &&
          dateTime.month == selectedDate.month &&
          dateTime.year == selectedDate.year){
        return true;
      }
      return false;
    }).toList();

    /// todo sort
    taskList.sort((Task task1,Task task2){
      DateTime dateTime1 = DateTime.fromMicrosecondsSinceEpoch(task1.date);
      DateTime dateTime2 = DateTime.fromMicrosecondsSinceEpoch(task2.date);
      // print('dateTime1 = ${dateTime1} = ${task1.date}');
      // print(dateTime2);
      return dateTime1.compareTo(dateTime2);
    });
    notifyListeners();
  }

  void changeSelectedDate(DateTime newDate){
    selectedDate =newDate;
    notifyListeners();
  }

  Future<void> changeIsDoneTask(Task task){
    return editTaskIsDone(task);
  }
  Future<void> editTask(Task task){
    return editTaskToFireStore(task);
  }
}