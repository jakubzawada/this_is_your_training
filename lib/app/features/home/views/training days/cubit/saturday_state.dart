part of 'saturday_cubit.dart';

@freezed
class SaturdayState with _$SaturdayState {
  factory SaturdayState({
    @Default([]) List<TrainingModel> documents,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _SaturdayState;
}
