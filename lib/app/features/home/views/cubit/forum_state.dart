part of 'forum_cubit.dart';

@freezed
class ForumState with _$ForumState {
  factory ForumState({
    @Default([]) List<ForumModel> docs,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _ForumState;
}
