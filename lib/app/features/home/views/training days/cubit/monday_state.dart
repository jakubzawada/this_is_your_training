part of 'monday_cubit.dart';

@freezed
class MondayState with _$MondayState {
  factory MondayState({
    @Default([]) List<TrainingModel> documents,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _MondayState;
}
