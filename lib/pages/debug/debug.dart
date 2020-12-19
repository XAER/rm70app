import 'package:flutter/material.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:r70app/keys/api.dart';

class Debug extends StatefulWidget {
  @override
  _DebugState createState() => _DebugState();
}

class _DebugState extends State<Debug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){},
          child: Text("Send"),
        ),
      ),
    );
  }
}
