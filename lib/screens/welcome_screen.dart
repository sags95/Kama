import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoey_flutter/Widgets/rounded_icon_btn.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';



class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48,
              ),
              Text(
                'Kama',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Todo lists, simplified',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(
                height: 48,
              ),
              RoundedIconButton(
                btnColor: Color(0xff6200EE),
                title: 'Sign in with Google',
                fun: (){

                  Navigator.pushNamed(context, TasksScreen.id);
                },
                icon: FontAwesomeIcons.google,
              ),
              RoundedIconButton(
                btnColor: Color(0xff8a00ee),
                title: 'Sign in with Facebook',
                fun: (){},
                icon: FontAwesomeIcons.facebook,
              ),
              Expanded(
                child: Image.asset(
                  'images/clip-list-is-empty.png',
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
