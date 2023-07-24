part of 'forum_cubit.dart';

@immutable
class ForumState {
  final List<ForumModel> docs;
  final bool isLoading;
  final String errorMessage;

  const ForumState({
    this.docs = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
