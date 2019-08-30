import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  TasksList({this.tasks});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        //context = where parent widget is in build tree
        return TaskTile(
            taskTitle: widget.tasks[index].name, //Use widget to access Class fields
            isChecked: widget.tasks[index].isDone,
            checkBoxCallback: (bool checkBoxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length, //Tells builder how many tasks to build (as many in tasks)
    );
  }
}
