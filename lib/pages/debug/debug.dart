import 'package:flutter/material.dart';
import 'package:r70app/auth/signin.dart';
import 'package:r70app/net/flutterfire.dart';

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
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Esegui l'accesso con le tue credenziali!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Column(
              children: [
                logIn(context),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  child: RaisedButton(
                    child: Text("Accedi"),
                    onPressed: () async {
                      bool succesfulSignIn =
                          await signIn(login.text, pass.text);

                      if (succesfulSignIn) {
                        Navigator.pushNamed(context, "/home");
                      }
                    },
                  ),
                ),
              ],
            )),
          ],
        ));
  }
}
