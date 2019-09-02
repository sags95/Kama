import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/rounded_btn.dart';
import 'package:todoey_flutter/screens/login_screen.dart';
import 'package:todoey_flutter/screens/reg_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

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
              RoundedButton(
                btnColor: Color(0xff6200EE),
                title: 'Sign In',
                fun: () => Navigator.pushNamed(context, LoginScreen.id),
              ),
              RoundedButton(
                btnColor: Color(0xff8a00ee),
                title: 'Create Account',
                fun: () => Navigator.pushNamed(context, RegScreen.id),
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
