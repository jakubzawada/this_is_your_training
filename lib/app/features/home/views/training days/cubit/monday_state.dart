part of 'monday_cubit.dart';

@immutable
class MondayState {
  final List<DocumentModel> documents;
  final bool isLoading;
  final String errorMessage;

  const MondayState({
     this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
