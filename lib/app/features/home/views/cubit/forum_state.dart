part of 'forum_cubit.dart';

@immutable
class ForumState {
  final List<QueryDocumentSnapshot<Object?>> docs;
  final bool isLoading;
  final String errorMessage;

  const ForumState({
    required this.docs,
    required this.isLoading,
    required this.errorMessage,
  });
}