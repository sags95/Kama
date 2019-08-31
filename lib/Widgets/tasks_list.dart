import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatefulWidget {

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) { //Provides taskData instead of provider.of. Consumer listens for changes from task_data
        return ListView.builder(
          itemBuilder: (context, index) {

            return TaskTile(
                taskTitle: taskData.tasks[index].name, //
                isChecked: taskData.tasks[index].isDone,
                checkBoxCallback: (bool checkBoxState) {
//              setState(() {
//                Provider.of<TaskData>(context).tasks[index].toggleDone();
//              });
                });
          },
          itemCount: taskData.taskCount, //Tells builder how many tasks to build (as many in tasks)
        );
      },
    );
  }
}
