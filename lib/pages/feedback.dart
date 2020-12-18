import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:url_launcher/url_launcher.dart';

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  TextEditingController _nome = TextEditingController();

  TextEditingController _feedForm = TextEditingController();
  void sendMail(String mail, String subject, String body) =>
      launch("mailto:$mail?subject=$subject&body=$body");

  Widget _isLoggedIn(BuildContext context) {
    try {
      User user = FirebaseAuth.instance.currentUser;
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user.uid.toString()).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            return Column(
              children: [
                Text(
                  "Nome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${data['full_name']}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${user.email.toString()}"),
              ],
            );
          }

          return Text("loading");
        },
      );
    } catch (e) {
      print(e);
      return Container(
        width: 340,
        height: 40,
        child: TextFormField(
          controller: _nome,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: "Mario",
            labelText: "Nome",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxLines = 6;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Completa il form con il tuo feedback!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _isLoggedIn(context),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 340,
                height: maxLines * 30.0,
                child: TextField(
                  controller: _feedForm,
                  keyboardType: TextInputType.multiline,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: "Inserisci qui il tuo feedback!",
                    labelText: "Feedback",
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 340,
                child: Text(
                  "Premendo il tasto invia si aprirà l'app default per inviare le mail, dovrai solo inviarla per mandare il tuo feedback!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  sendMail("colonnelli.st@gmail.com", "Feedback per RM70APP",
                      _feedForm.text);
                },
                child: Text("Invia"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
