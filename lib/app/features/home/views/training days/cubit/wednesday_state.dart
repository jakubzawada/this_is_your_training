part of 'wednesday_cubit.dart';

@immutable
class WednesdayState {
  final List<TrainingModel> documents;
  final bool isLoading;
  final String errorMessage;

  const WednesdayState({
    this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });
}
