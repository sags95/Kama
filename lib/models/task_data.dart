import "package:flutter/foundation.dart";
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy computer'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy food'),
  ];

  int get taskCount {
    return tasks.length;
  }
}