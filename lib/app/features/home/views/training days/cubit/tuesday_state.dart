part of 'tuesday_cubit.dart';

@freezed
class TuesdayState with _$TuesdayState {
  factory TuesdayState({
    @Default([]) List<TrainingModel> results,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _TuesdayState;
}
