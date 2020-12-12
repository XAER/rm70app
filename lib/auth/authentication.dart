import 'package:flutter/material.dart';
import 'package:r70app/auth/signin.dart';
import 'package:r70app/net/flutterfire.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // get the input from the text field

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
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.lightBlue,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Errore!",
                                            style: TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "La mail inserità è invalida o non presente nel sistema.\nRiprovare.",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Chiudi",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                            });
                      }
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Unisciti a noi di Roma 70! Registrati!"))
              ],
            )),
          ],
        ));
  }
}
