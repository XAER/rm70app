import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(
    String name, String username, String email, String password) async {
  try {
    // When creating a new user I want it to be added to the Database
    // to store the User name, surname and Nickname, I can make these 3
    // values mandatory so they pass through the register function and
    // I can add them to the DB
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Add user to the database collection
      return users
          .doc(FirebaseAuth.instance.currentUser.uid.toString())
          .set({'full_name': "$name", 'username': username.toString()})
          .then((value) => print('User Added'))
          .catchError((error) => print("Failed to add user: $error"));
    }

    addUser();

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('La password inserita è troppo debole,');
    } else if (e.code == 'email-already-in-use') {
      print('Un account è già registrato con la mail che hai inserito');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
