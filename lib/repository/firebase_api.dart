import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:libros/models/user.dart' as UserApp;

class FirebaseApi {
  Future<String?> registerUser(String email, String password) async {
    try {
      final credencial = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credencial.user?.uid;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      print(e);
      return e.code;
    }
  }

  Future<String?> logInUser(String email, String password) async {
    try {
      final credencial = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credencial.user?.uid;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      print(e);
      return e.code;
    }
  }

  Future<String> createUser(UserApp.User user) async {
    try {
      final document = await FirebaseFirestore.instance
          .collection("users")
          .add(user.toJson());

      return user.uid;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code;
    }
  }
}
