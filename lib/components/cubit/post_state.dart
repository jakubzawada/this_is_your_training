part of 'post_cubit.dart';

@immutable
class PostState {
  final List<DocumentSnapshot<Object?>> docs;
  final bool isLoading;
  final String errorMessage;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final bool isLiked;

  PostState({
    required this.docs,
    required this.isLoading,
    required this.errorMessage,
    this.isLiked = false,
  });

  PostState copyWith({
    List<DocumentSnapshot<Object?>>? docs,
    String? errorMessage,
    bool? isLoading,
    bool? isLiked,
  }) {
    return PostState(
      docs: docs ?? this.docs,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
