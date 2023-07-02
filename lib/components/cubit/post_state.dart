part of 'post_cubit.dart';

@immutable
class PostState {
  final List<QueryDocumentSnapshot<Object?>> docs;
  final bool isLoading;
  final String errorMessage;

  const PostState({
    required this.docs,
    required this.isLoading,
    required this.errorMessage,
  });
}
