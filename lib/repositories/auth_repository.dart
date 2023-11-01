import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/data/data_sources/auth_remote_data_source.dart';

@injectable
class AuthRepository {
  final AuthDataSource authdataSource;

  AuthRepository({required this.authdataSource});

  Future<void> signOut() async {
    authdataSource.signOut();
  }

  Stream<User?> start() {
    return authdataSource.start();
  }
}
