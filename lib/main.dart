import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/signup_screen.dart';

import 'screens/login_screen.dart';

void main() => runApp(InstaClone());

class InstaClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Clone',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case LoginScreen.id:
            return CupertinoPageRoute(
                builder: (_) => LoginScreen(), settings: settings);
          case SignupScreen.id:
            return CupertinoPageRoute(
                builder: (_) => SignupScreen(), settings: settings);
          default:
            return CupertinoPageRoute(
                builder: (_) => LoginScreen(), settings: settings);
        }
      },
    );
  }
}
