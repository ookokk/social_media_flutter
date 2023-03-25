import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  Future signInAnonymous() async {
    try {
      final result = await firebaseAuth.signInAnonymously();
      print(result.user!.uid);
      return result.user;
    } catch (e) {
      print("Anon error $e");
      return null;
    }
  }

  Future forgetPassword(String email) async {
    try {
      final result = await firebaseAuth.sendPasswordResetEmail(email: email);
      print("please check your email");
    } catch (e) {}
  }

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res == "User not found";
      } else if (e.code == "wrong-password") {
        res == "Wrong password";
      } else if (e.code == "user-disabled") {
        res == "User blocked";
      }
    }
    return res;
  }

  Future<String?> signUp(
      String email, String username, String fullname, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      try {
        final resultData = await firebaseFirestore.collection("Users").add({
          "email": email,
          "fullname": fullname,
          "username": username,
          "post": [],
          "followers": [],
          "following": [],
          "bio": "",
          "website": ""
        });
      } catch (e) {
        print("$e");
      }
      res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          res = "Mail Zaten Kayitli.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Gecersiz Mail";
          break;
        default:
          res = "Bir Hata Ile Karsilasildi, Birazdan Tekrar Deneyiniz.";
          break;
      }
    }
    return res;
  }
}
