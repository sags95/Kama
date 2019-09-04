import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main () => runApp(MyApp());

//TODO: get auth status and render proper screen

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUser = false;

  @override
   initState() {
     FirebaseAuth.instance.currentUser().then((curUser){
       if (curUser != null){
         isUser = true;
         Navigator.pushReplacementNamed(context, TasksScreen.id);
       } else {
         Navigator.pushReplacementNamed(context, WelcomeScreen.id);
       }
     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( //root provider
      builder: (context) => TaskData(), //Providing task data to all children which want to listen for changes
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'WorkSans',
          scaffoldBackgroundColor: Color(0xff121212),
          accentColor: Color(0xff6200EE),
          primaryColor: Color(0xff8a00ee),
        ),
        initialRoute: _MyAppState().isUser ? TasksScreen.id : WelcomeScreen.id,
        routes: {
          TasksScreen.id: (context) => TasksScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
        },
      ),
    );
  }
}