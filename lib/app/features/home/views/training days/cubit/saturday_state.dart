part of 'saturday_cubit.dart';

@freezed
class SaturdayState with _$SaturdayState {
  factory SaturdayState({
    @Default([]) List<TrainingModel> results,
    @Default(Status.loading) Status status,
    @Default('') String errorMessage,
  }) = _SaturdayState;
}
