import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.currentUser().then((curUser) {
      if (curUser != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => TasksScreen(loggedUser: curUser, photoUrl: curUser.photoUrl)
        ));
      } else {
        Navigator.pushReplacementNamed(context, WelcomeScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
