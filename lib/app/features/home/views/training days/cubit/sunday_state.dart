part of 'sunday_cubit.dart';

@immutable
class SundayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const SundayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
