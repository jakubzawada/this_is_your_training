import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/repositories/step_repository.dart';

class MockStepRepository extends Mock implements StepRepository {}

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  late StepCounterCubit sut;
  late MockStepRepository repository;

  setUp(() {
    repository = MockStepRepository();
    sut = StepCounterCubit(stepRepository: repository);
  });

  group('togglePedometer', () {
    blocTest<StepCounterCubit, StepCounterState>(
      'emit isPeometerActive',
      build: () => sut,
      act: (cubit) => cubit.togglePedometer(),
      expect: () => [
        StepCounterState(isPedometerActive: false),
      ],
    );
  });
}
