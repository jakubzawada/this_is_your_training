part of 'saturday_cubit.dart';

@immutable
class SaturdayState {
  final List<DocumentModel> documents;
  final bool isLoading;
  final String errorMessage;


  const SaturdayState({
     this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
