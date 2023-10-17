part of 'friday_cubit.dart';

@freezed
class FridayState with _$FridayState {
  factory FridayState({
    @Default([]) List<TrainingModel> results,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _FridayState;
}
