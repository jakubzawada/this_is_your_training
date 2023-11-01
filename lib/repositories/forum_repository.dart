import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/data/data_sources/forum_remote_data_source.dart';
import 'package:this_is_your_training/models/forum_model.dart';

@injectable
class ForumRepository {
  final ForumRemoteDataSource forumdataSource;

  ForumRepository({required this.forumdataSource});

  Stream<List<ForumModel>> getPostsStream() {
    return forumdataSource.getPostsData().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          final json = doc.data();
          json['id'] = doc.id;
          return ForumModel.fromJson(json);
        },
      ).toList();
    });
  }

  Future<void> postMessage({
    required String textController,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    String? avatarUrl = await forumdataSource.getLatestImage(currentUser.uid);

    avatarUrl ??= "images/Profile.jpg";

    await forumdataSource.postMessage(
      textController: textController,
      avatarUrl: avatarUrl,
    );
  }
}
