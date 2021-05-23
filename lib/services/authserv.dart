import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthe {

  Future<String> currentServicer();
  Future<String> signIn(String email, String password);
  Future<String> createServicer(String email, String password);
  Future<void> signOut();
}

class Authe implements BaseAuthe {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    FirebaseUser servicer = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return servicer.uid;
  }

  Future<String> createServicer(String email, String password) async {
    FirebaseUser servicer = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return servicer.uid;
  }

  Future<String> currentServicer() async {
    FirebaseUser servicer = await _firebaseAuth.currentUser();
    return servicer != null ? servicer.uid : null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

}