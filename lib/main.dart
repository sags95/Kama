import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';


void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( //root provider
      builder: (context) => TaskData(), //Providing task data to all children which want to listen for chagnges
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'WorkSans'
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black45,
        ),
        home: TasksScreen(),
      ),
    );
  }
}