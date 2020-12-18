import 'package:flutter/material.dart';

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
    );
  }
}
