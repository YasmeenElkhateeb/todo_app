import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/providers/AppConfigProvider.dart';

import '../firebase_utils.dart';
import '../model/task.dart';
import 'edit_task.dart';

class ItemTask extends StatelessWidget{
  Task task;

  ItemTask ({required this.task});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(EditTask.routeName,arguments: task);
      },
      child: Container(
          margin: EdgeInsets.only(left: 20),
        child: Slidable(
          // Specify a key if the Slidable is dismissible.
          key: const ValueKey(0),

          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            extentRatio: 0.25,
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // // A pane can dismiss the Slidable.
            // dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children:[
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context){deleteTaskFromFireStore(task);},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(topLeft:Radius.circular(10), bottomLeft: Radius.circular(10)),
              ),
            ],
          ),

          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(right: 20,top: 20,bottom: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyTheme.whiteColor,),
            child: Row(
              children: [
                Container(
                  color: task.isDone ? MyTheme.greenColor : Theme.of(context).primaryColor,
                  height: 80,
                  width: 5,
                ),
                SizedBox(width: 15,),
                Expanded(
                    child: Column(
                      children: [
                        Text('${task.title}', style: task.isDone ? Theme.of(context).textTheme.subtitle2 : Theme.of(context).textTheme.subtitle1,),
                        SizedBox(height: 15,),
                        Text('Description :${task.description} ----- Date :${DateTime.fromMicrosecondsSinceEpoch(task.date)}',style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    )
                ),
                SizedBox(width: 15,),
                InkWell(
                  onTap: (){
                    Provider.of<AppConfigProvider>(context,listen: false).changeIsDoneTask(task);
                  },
                  child: task.isDone ?
                  Text('Done!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: MyTheme.greenColor),):
                  Container(
                    // color: MyTheme.primaryLight,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyTheme.primaryLight,),
                    child: Icon(Icons.check ,color: MyTheme.whiteColor ,size: 30,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}