import 'package:flutter_test/flutter_test.dart';
import 'package:this_is_your_training/models/post_model.dart';

void main() {
  test('Creating a PostModel and downloading docs', () {
    // 1
    final DateTime now = DateTime.now();
    final model = PostModel('commentText', now, 'commentedBy');

    // 2
    final commentText = model.commentText;
    final commentedBy = model.commentedBy;

    // 3
    expect(commentText, 'commentText');
    expect(commentedBy, 'commentedBy');
  });
}
