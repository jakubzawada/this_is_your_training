part of 'tuesday_cubit.dart';

@immutable
class TuesdayState {
  final List<DocumentModel> documents;
  final bool isLoading;
  final String errorMessage;

  const TuesdayState({
     this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
