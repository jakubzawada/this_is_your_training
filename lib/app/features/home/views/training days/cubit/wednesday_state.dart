part of 'wednesday_cubit.dart';

@freezed
class WednesdayState with _$WednesdayState {
  factory WednesdayState({
    @Default([]) List<TrainingModel> results,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _WednesdayState;
}
