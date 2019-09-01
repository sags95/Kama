import "package:flutter/foundation.dart";
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [

  ];

  UnmodifiableListView<Task> get tasks { //Protects task, forces use of addTask method
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask (String newTaskTitle){
    final task = Task(name: newTaskTitle);
    print(task.name);
    _tasks.add(task);
    notifyListeners(); //IMPORTANT, notify listeners
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners(); //update listeners
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}