import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class BaseAuth {
  Future<void> signIn(String email, String password);
  Future<void> createUser(String email, String password);
  Future<void> signOut();
}

class Auth implements BaseAuth {
  static final Auth _singleton = Auth._internal();

  factory Auth() {
    return _singleton;
  }

  Auth._internal();
  static User user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static initialize() async {
    FirebaseAuth.instance.authStateChanges().listen((User u) {
      if (u == null) {
        print('User is currently signed out!');
        user = null;
      } else {
        print('User is signed in!');
        user = u;
      }
    });
  }

  Future<void> signIn(String email, String password) async {
    var fUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    user = fUser.user;
  }

  Future<void> createUser(String email, String password) async {
    var fUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    user = fUser.user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
