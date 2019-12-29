import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/feed_screen.dart';
import 'package:instaclone/screens/signup_screen.dart';

import 'screens/login_screen.dart';

void main() => runApp(InstaClone());

class InstaClone extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.email);
          return FeedScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Clone',
      debugShowCheckedModeBanner: false,
      home: _getScreenId(),
//      routes: {
//        LoginScreen.id: (context) => LoginScreen(),
//        SignupScreen.id: (context) => SignupScreen(),
//        FeedScreen.id: (context) => FeedScreen(),
//      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case LoginScreen.id:
            return CupertinoPageRoute(
                builder: (_) => LoginScreen(), settings: settings);
          case SignupScreen.id:
            return CupertinoPageRoute(
                builder: (_) => SignupScreen(), settings: settings);
          case FeedScreen.id:
            return CupertinoPageRoute(
                builder: (_) => FeedScreen(), settings: settings);
          default:
            return CupertinoPageRoute(
                builder: (_) => LoginScreen(), settings: settings);
        }
      },
    );
  }
}
