part of 'sunday_cubit.dart';

@freezed
class SundayState with _$SundayState {
  factory SundayState({
    @Default([]) List<TrainingModel> documents,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _SundayState;
}
