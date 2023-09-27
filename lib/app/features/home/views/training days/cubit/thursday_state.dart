part of 'thursday_cubit.dart';

@freezed
class ThursdayState with _$ThursdayState {
  factory ThursdayState({
    @Default([]) List<TrainingModel> documents,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _ThursdayState;
}
