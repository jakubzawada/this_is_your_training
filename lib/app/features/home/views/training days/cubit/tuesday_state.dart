part of 'tuesday_cubit.dart';

@freezed
class TuesdayState with _$TuesdayState {
  factory TuesdayState({
    @Default([]) List<TrainingModel> documents,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _TuesdayState;
}
