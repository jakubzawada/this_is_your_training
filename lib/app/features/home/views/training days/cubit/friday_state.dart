part of 'friday_cubit.dart';

@immutable
class FridayState {
  final List<TrainingModel> documents;
  final bool isLoading;
  final String errorMessage;

  const FridayState({
    this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
