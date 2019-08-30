import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCall;

  AddTaskScreen(this.addTaskCall);

  @override
  Widget build(BuildContext context) {
    String taskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                onChanged: (val){
                   taskTitle = val;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your task',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                  ),
                  fillColor: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              FlatButton(
                onPressed: () {
                  addTaskCall(taskTitle);
                  Navigator.pop(context);
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
