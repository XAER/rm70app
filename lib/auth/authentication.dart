import 'package:flutter/material.dart';
import 'package:r70app/net/flutterfire.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // get the input from the text field
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Ciao! \nAccedi con le tue credenziali o registrati!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 35,
                ),
                Container(
                  width: 180,
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      icon: Icon(Icons.text_fields_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Mario",
                      labelText: "Nome",
                    ),
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Container(
                  width: 146,
                  child: TextFormField(
                    controller: _surname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Rossi",
                      labelText: "Cognome",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 340,
              child: TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: "Nome Utente",
                  labelText: "Username",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 340,
              child: TextFormField(
                controller: _emailField,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: "example@email.com",
                  labelText: "Email",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 340,
              child: TextFormField(
                controller: _passField,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: "password",
                    labelText: "Password"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: RaisedButton(
                  onPressed: () async {
                    bool shouldNavigate = await register(
                        _name.text,
                        _surname.text,
                        _username.text,
                        _emailField.text,
                        _passField.text);
                    if (shouldNavigate) {
                      // REGISTRAZIONE
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
                                    "La mail inserità è invalida o già presente nel sistema.\nRiprovare.",
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
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: Text("Registrati")),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                  onPressed: () async {
                    bool shouldNavigate =
                        await signIn(_emailField.text, _passField.text);
                    if (shouldNavigate) {
                      // Navigate
                      Navigator.popAndPushNamed(context, "/home");
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
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: Text("Accedi")),
            )
          ]),
        ),
      ),
    );
  }
}
