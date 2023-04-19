part of 'thursday_cubit.dart';

@immutable
class ThursdayState {
  final List<DocumentModel> documents;
  final bool isLoading;
  final String errorMessage;

  const ThursdayState({
     this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
