part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  factory PostState({
    @Default([]) List<PostModel> docs,
    @Default('') String errorMessage,
    @Default(false) bool isLiked,
    @Default('') String avatarUrl,
    @Default(false) bool saved,
    @Default(Status.loading) Status status,
  }) = _PostState;
}
