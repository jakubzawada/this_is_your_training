part of 'thursday_cubit.dart';

@immutable
class ThursdayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const ThursdayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
