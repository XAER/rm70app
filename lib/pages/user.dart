import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pagina Utente",
          style: TextStyle(
              fontSize: 20, letterSpacing: 3, color: Colors.amberAccent),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.account_circle,
              size: 120,
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.mail),
                SizedBox(
                  width: 10,
                ),
                Text("Mail:",
                    style: TextStyle(
                        letterSpacing: 2, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 20,
                ),
                Text(FirebaseAuth.instance.currentUser.email.toString(),
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.popAndPushNamed(context, "/home");
                  },
                  child: Text("Esci"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
