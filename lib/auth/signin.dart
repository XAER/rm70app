import 'package:flutter/material.dart';

TextEditingController login = TextEditingController();
TextEditingController pass = TextEditingController();

Widget logIn(BuildContext context) {
  // Create a Widget (default) that returns the whole form for signin in
  return Container(
    width: 340,
    child: Column(
      children: [
        // Mail
        TextFormField(
          controller: login,
          decoration: InputDecoration(
            icon: Icon(Icons.mail),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: "example@email.com",
            labelText: "Email",
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // Passw
        TextFormField(
          controller: pass,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.vpn_key_outlined),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: "●●●●●●●●",
            labelText: "Password",
          ),
        ),
      ],
    ),
  );
}
