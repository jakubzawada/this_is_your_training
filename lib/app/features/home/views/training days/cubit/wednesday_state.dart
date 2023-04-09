part of 'wednesday_cubit.dart';

@immutable
class WednesdayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const WednesdayState({
    required this.documents,
     required this.isLoading,
    required this.errorMessage,
  });
}
