import 'package:firebase_auth/firebase_auth.dart';

class AuthController {

  Future<bool> login(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if(user != null) {
        return true;
      } else {
        return false;
      }
    } catch(e) {
      print(e);
      return false;
    }
  }
}
