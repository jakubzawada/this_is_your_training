part of 'thursday_cubit.dart';

@freezed
class ThursdayState with _$ThursdayState {
  factory ThursdayState({
    @Default([]) List<TrainingModel> results,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _ThursdayState;
}
