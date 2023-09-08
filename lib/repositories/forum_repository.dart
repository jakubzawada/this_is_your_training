import 'package:firebase_auth/firebase_auth.dart';
import 'package:this_is_your_training/data/forum_data_sources/forum_remote_data_source.dart';
import 'package:this_is_your_training/models/forum_model.dart';

class ForumRepository {
  final ForumRemoteDataSource _forumdataSource;

  ForumRepository(this._forumdataSource);

  Stream<List<ForumModel>> getPostsStream() {
    return _forumdataSource.getPostsData().map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          final json = doc.data();
          json['id'] = doc.id;
          return ForumModel.fromJson(json, doc.id);

          // return ForumModel(
          //   id: doc.id,
          //   avatarURL: doc['AvatarUrl'],
          //   likes: List<String>.from(doc['Likes'] as List<dynamic>),
          //   message: doc['Message'],
          //   timeStamp: doc['TimeStamp'],
          //   userEmail: doc['UserEmail'],
          // );
        },
      ).toList();
    });
  }

  Future<void> postMessage({
    required String textController,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    String? avatarUrl = await _forumdataSource.getLatestImage(currentUser.uid);

    await _forumdataSource.postMessage(
      textController: textController,
      avatarUrl: avatarUrl!,
    );
  }
}
