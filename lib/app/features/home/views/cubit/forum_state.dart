part of 'forum_cubit.dart';

@freezed
class ForumState with _$ForumState {
  factory ForumState({
    @Default([]) List<ForumModel> results,
    @Default('') String errorMessage,
    @Default(Status.loading) Status status,
  }) = _ForumState;
}
