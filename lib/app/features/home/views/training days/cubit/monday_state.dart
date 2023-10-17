part of 'monday_cubit.dart';

@freezed
class MondayState with _$MondayState {
  factory MondayState({
    @Default([]) List<TrainingModel> results,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _MondayState;
}
