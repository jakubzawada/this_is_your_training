import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDataSource {
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Stream<User?> start() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
