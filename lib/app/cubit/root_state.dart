part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    User? user,
    @Default('') String errorMessage,
    @Default(Status.loading) Status status,
  }) = _RootState;
}
