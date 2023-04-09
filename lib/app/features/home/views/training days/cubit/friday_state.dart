part of 'friday_cubit.dart';

@immutable
class FridayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const FridayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
