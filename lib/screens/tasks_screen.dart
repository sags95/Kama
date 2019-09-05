import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/tasks_list.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoey_flutter/screens/welcome_screen.dart';


class TasksScreen extends StatelessWidget {
  static const String id = 'task_screen';
  final FirebaseUser loggedUser;
  final String photoUrl;
  final _auth = FirebaseAuth.instance;

  TasksScreen({this.loggedUser, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen((taskTitle) {}));
        },
        backgroundColor: Color(0xff6200EE),
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Kama',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${Provider.of<TaskData>(context).taskCount} Tasks', //Reading from provider to get amount of tasks
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                       PopupMenuButton(
                        onSelected: (val){
                          _auth.signOut();
                          Navigator.popAndPushNamed(context, WelcomeScreen.id);
                          },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          const PopupMenuItem(
                            value: true,
                            child: ListTile(
                              dense: true,
                              title: Text(
                                'Sign Out'
                              ),
                            ),
                          ),
                        ],
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(photoUrl),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xff1F1b24),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
