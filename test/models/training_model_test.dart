import 'package:flutter_test/flutter_test.dart';
import 'package:this_is_your_training/models/training_model.dart';

void main() {
  test('Creating a TrainingModel and downloading docs', () {
    // 1
    final model = TrainingModel('push ups', '1', 2, 35);

    // 2
    final result = model.name;

    // 3
    expect(result, 'push ups');
  });
}
