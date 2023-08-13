import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteDataSource {
  Future<void> loginAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
