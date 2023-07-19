part of 'post_cubit.dart';

@immutable
class PostState {
  final List<DocumentSnapshot<Object?>> docs;
  final bool isLoading;
  final String errorMessage;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final bool isLiked;
  final String avatarUrl;

  PostState({
    required this.docs,
    required this.isLoading,
    required this.errorMessage,
    this.isLiked = false,
    required this.avatarUrl,
  });

  PostState copyWith({
    List<DocumentSnapshot<Object?>>? docs,
    String? errorMessage,
    bool? isLoading,
    bool? isLiked,
    String? avatarUrl,
  }) {
    return PostState(
      docs: docs ?? this.docs,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isLiked: isLiked ?? this.isLiked,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
