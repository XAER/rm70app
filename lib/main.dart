import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:r70app/pages/bars.dart';
import 'package:r70app/pages/home.dart';
import 'package:r70app/pages/loading.dart';
import 'package:r70app/pages/user.dart';
import 'package:r70app/pages/weatherpage.dart';
import 'package:r70app/auth/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/bars": (context) => Bars(),
      "/weather": (context) => WeatherPage(),
      "/authentication": (context) => Authentication(),
      "/user": (context) => UserPage(),
    },
  ));
}
