part of 'training_days_cubit.dart';

@immutable
class TrainingDaysState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const TrainingDaysState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
