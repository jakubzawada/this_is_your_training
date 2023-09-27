part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    User? user,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _RootState;
}
