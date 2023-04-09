part of 'saturday_cubit.dart';

@immutable
class SaturdayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const SaturdayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
