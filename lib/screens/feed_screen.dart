import 'package:flutter/material.dart';
import 'package:instaclone/services/auth_service.dart';

class FeedScreen extends StatefulWidget {
  static const String id = 'feed_screen';

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(context),
          child: Text('Logout'),
        ),
      ),
    );
  }
}
