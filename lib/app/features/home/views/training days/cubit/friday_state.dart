part of 'friday_cubit.dart';

@freezed
class FridayState with _$FridayState {
  factory FridayState({
    @Default([]) List<TrainingModel> documents,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _FridayState;
}
