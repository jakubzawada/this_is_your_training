import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/data/data_sources/auth_remote_data_source.dart';

class AuthRepository {
  final AuthDataSource rootdataSource;

  AuthRepository({required this.rootdataSource});

  Future<void> signOut() async {
    rootdataSource.signOut();
  }

  Stream<User?> start() {
    return rootdataSource.start();
  }
}
