import 'package:flutter/material.dart';

import '../my_theme.dart';

class AddTaskBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add New Task',textAlign: TextAlign.center,),
          SizedBox(height: 25,),
          Form(child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Task Title'),
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Task Description'),
                maxLines: 4,
                minLines: 4,
              )
            ],
          )),
          SizedBox(height: 15,),
          Text('Select Date'),
          SizedBox(height: 15,),
          Container(
            // color: MyTheme.whiteColor,
            padding: EdgeInsets.all(15),
            // decoration: BoxDecoration(
            //     border:
            //     Border.all(color: MyTheme.primaryLight, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('08/12/2022',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: MyTheme.primaryLight,
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text('Add')
          )


        ],
      ),
    );
  }

}