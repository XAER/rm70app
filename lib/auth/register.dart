import 'package:flutter/material.dart';
import 'package:r70app/net/flutterfire.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("Registrati!"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Registrazione",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    icon: Icon(Icons.text_fields_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Mario",
                    labelText: "Nome",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Nome utente",
                    labelText: "Nome utente",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: mail,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "esempio@email.com",
                    labelText: "Indirizzo Mail",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "●●●●●●●●",
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 150,
                child: RaisedButton(
                  onPressed: () async {
                    bool shouldNavigate = await register(
                        name.text, username.text, mail.text, pass.text);
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
                  child: Text("Registrati"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
