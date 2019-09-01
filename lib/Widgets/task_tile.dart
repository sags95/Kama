import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  final Function deleteTask;

  TaskTile({this.isChecked, this.taskTitle, this.checkBoxCallback, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Colors.white
      ),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            color: Colors.white,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        onLongPress: (){
          deleteTask();
        },
        trailing: Checkbox(
            activeColor: Color(0xff6200EE),
            value: isChecked,
            onChanged: checkBoxCallback,
        ),
      ),
    );
  }
}
