import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Stream<User?> start() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
