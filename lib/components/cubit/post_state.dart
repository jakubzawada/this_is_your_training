part of 'post_cubit.dart';

@immutable
class PostState {
  final List<PostModel> docs;
  final bool isLoading;
  final String errorMessage;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final bool isLiked;
  final String avatarUrl;
  final bool saved;

  PostState({
    this.docs = const [],
    required this.isLoading,
    required this.errorMessage,
    this.isLiked = false,
    required this.avatarUrl,
    this.saved = false,
  });

  PostState copyWith({
    List<PostModel>? docs,
    String? errorMessage,
    bool? isLoading,
    bool? isLiked,
    String? avatarUrl,
    bool? saved,
  }) {
    return PostState(
      docs: docs ?? this.docs,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isLiked: isLiked ?? this.isLiked,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      saved: saved ?? this.saved,
    );
  }
}
