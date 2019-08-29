import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy computer'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy food'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        //context = where parent widget is in build tree
        return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkBoxCallback: (bool checkBoxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length, //Tells builder how many tasks to build (as many in tasks)
    );
  }
}
