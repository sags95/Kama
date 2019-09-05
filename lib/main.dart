import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/screens/welcome_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //root provider
      builder: (context) =>
          TaskData(), //Providing task data to all children which want to listen for changes
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'WorkSans',
          scaffoldBackgroundColor: Color(0xff121212),
          accentColor: Color(0xff6200EE),
          primaryColor: Color(0xff8a00ee),
        ),
        initialRoute: SplashScreen.id,
        routes: {
          TasksScreen.id: (context) => TasksScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SplashScreen.id: (context) => SplashScreen(),
        },
      ),
    );
  }
}
