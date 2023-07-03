import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'post_delete_state.dart';

class PostDeleteCubit extends Cubit<PostDeleteState> {
  PostDeleteCubit() : super(PostDeleteState());

  Future<void> postDelete({required String postId}) async {
    final commentDocs = await FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .collection("Comments")
        .get();

    for (var doc in commentDocs.docs) {
      await doc.reference.delete();
    }

    FirebaseFirestore.instance
        .collection("UsersPosts")
        .doc(postId)
        .delete()
        .then((value) =>
            // ignore: avoid_print
            print('post deleted'))
        .catchError(
            // ignore: avoid_print
            (error) => print('failed to delete post: $error'));

    // ignore: use_build_context_synchronously
  }
}
