import 'package:flutter_test/flutter_test.dart';
import 'package:this_is_your_training/models/forum_model.dart';

void main() {
  test('ForumModel creation and message retrieval', () {
    // 1
    final DateTime now = DateTime.now();
    final model = ForumModel(
        'id', 'url', ['like1', 'like2'], 'message', now, 'user@gmail.com');

    // 2
    final result = model.message;
    final avatarURL = model.avatarURL;
    final userEmail = model.userEmail;

    // 3
    expect(result, 'message');
    expect(avatarURL, 'url');
    expect(userEmail, 'user@gmail.com');
  });
}
