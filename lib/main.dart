import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:r70app/pages/bars.dart';
import 'package:r70app/pages/debug/debug.dart';
import 'package:r70app/pages/feedback.dart' as feed;
import 'package:r70app/pages/home.dart';
import 'package:r70app/pages/info.dart';
import 'package:r70app/pages/loading.dart';
import 'package:r70app/pages/poste.dart';
import 'package:r70app/pages/user.dart';
import 'package:r70app/auth/authentication.dart';
import 'package:r70app/auth/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/bars": (context) => Bars(),
      "/authentication": (context) => Authentication(),
      "/user": (context) => UserPage(),
      "/poste": (context) => Poste(),
      "/register": (context) => Register(),
      "/debug": (context) => Debug(),
      "/feedback": (context) => feed.Feedback(),
      "/info": (context) => Info(),
    },
  ));
}
