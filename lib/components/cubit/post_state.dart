part of 'post_cubit.dart';

@immutable
class PostState {
  final List<QueryDocumentSnapshot<Object?>> docs;
  final bool isLoading;
  final String errorMessage;
  final currentUser = FirebaseAuth.instance.currentUser!;

  PostState({
    required this.docs,
    required this.isLoading,
    required this.errorMessage,
  });
}
