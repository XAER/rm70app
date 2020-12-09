import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  static User user = FirebaseAuth.instance.currentUser;
  final String _email = user.email;

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
                Text(_email.toString(),
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15)),
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
                Icon(Icons.text_fields_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Nome:",
                  style:
                      TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    _name.text,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Inserisci il tuo nome:",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    controller: _name,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: "Mario Rossi",
                                        hintStyle: TextStyle(fontSize: 12)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Okay"))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
