import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Widget _getUser(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user.uid.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Row(
            children: [
              Text(
                "Username: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Text(
                "${data['username']}",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }

  Widget _getName(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user.uid.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Row(
            children: [
              Text(
                "Nome: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Text(
                "${data['full_name']}",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }

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
                Text(
                  FirebaseAuth.instance.currentUser.email.toString(),
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.text_format_outlined),
                SizedBox(
                  width: 8,
                ),
                _getName(context),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.person),
                SizedBox(
                  width: 8,
                ),
                _getUser(context),
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
