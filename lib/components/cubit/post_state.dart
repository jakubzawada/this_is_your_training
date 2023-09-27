part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  factory PostState({
    @Default([]) List<PostModel> docs,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(false) bool isLiked,
    @Default('') String avatarUrl,
    @Default(false) bool saved,
  }) = _PostState;
}
