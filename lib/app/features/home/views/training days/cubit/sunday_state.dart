part of 'sunday_cubit.dart';

@immutable
class SundayState {
  final List<TrainingModel> documents;
  final bool isLoading;
  final String errorMessage;

  const SundayState({
    this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
