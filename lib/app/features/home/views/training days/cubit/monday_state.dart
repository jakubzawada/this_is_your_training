part of 'monday_cubit.dart';

@immutable
class TrainingPageState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const TrainingPageState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
