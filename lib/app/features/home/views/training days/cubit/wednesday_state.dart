part of 'wednesday_cubit.dart';

@freezed
class WednesdayState with _$WednesdayState {
  factory WednesdayState({
    @Default([]) List<TrainingModel> documents,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _WednesdayState;
}
