part of 'sunday_cubit.dart';

@freezed
class SundayState with _$SundayState {
  factory SundayState({
    @Default([]) List<TrainingModel> results,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _SundayState;
}
