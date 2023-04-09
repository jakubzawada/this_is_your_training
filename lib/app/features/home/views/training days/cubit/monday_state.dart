part of 'monday_cubit.dart';

@immutable
class MondayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const MondayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
