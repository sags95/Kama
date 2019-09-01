import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

String taskTitle;

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCall;
  AddTaskScreen(this.addTaskCall);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {


    return Container(
      color: Color(0xFF121212),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff242424),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //To force btn size to width of container
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w300,
                  fontSize: 30,
                  color: Color(0xffBB86FC),
                ),
              ),
              TextField(
                autofocus: true,
                onChanged: (val){
                   taskTitle = val;
                },
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                 // hintText: 'Enter your task',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  fillColor: Color(0xffBB86FC),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              FlatButton(
                onPressed: () {
                  Provider.of<TaskData>(context).addTask(taskTitle); //Add task to changeNotifier
                  Navigator.pop(context);
                },
                color: Color(0xff6200EE),
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
