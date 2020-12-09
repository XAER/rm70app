import 'package:flutter/material.dart';
import 'package:r70app/net/flutterfire.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // get the input from the text field
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Ciao! \nAccedi con le tue credenziali o registrati!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
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
                  bool shouldNavigate =
                      await register(_emailField.text, _passField.text);
                  if (shouldNavigate) {
                    // Navigate
                    Navigator.pushNamed(context, "/home");
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
                  }
                },
                padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: Text("Accedi")),
          )
        ]),
      ),
    );
  }
}
