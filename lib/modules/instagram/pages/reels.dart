import 'package:flutter/material.dart';

class UserReels extends StatefulWidget {
  const UserReels({Key? key}) : super(key: key);

  @override
  _UserReelsState createState() => _UserReelsState();
}

class _UserReelsState extends State<UserReels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Reels')
      ),
    );
  }
}
