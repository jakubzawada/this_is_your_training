part of 'tuesday_cubit.dart';

@immutable
class TuesdayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const TuesdayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
