import 'package:flutter/material.dart';

class UserActions extends StatefulWidget {
  const UserActions({Key? key}) : super(key: key);

  @override
  _UserActionsState createState() => _UserActionsState();
}

class _UserActionsState extends State<UserActions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Actions'),
      ),
    );
  }
}

