import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/data/forum_data_sources/root_remote_data_source.dart';

class RootRepository {
  final RootDataSource rootdataSource;

  RootRepository({required this.rootdataSource});

  Future<void> signOut() async {
    rootdataSource.signOut();
  }

  Stream<User?> start() {
    return rootdataSource.start();
  }
}
