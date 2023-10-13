import 'package:flutter_test/flutter_test.dart';
import 'package:this_is_your_training/models/forum_model.dart';

void main() {
  test('Creating a ForumModel and downloading docs', () {
    // 1
    final DateTime now = DateTime.now();
    final model = ForumModel(
        'id', 'url', ['like1', 'like2'], 'message', now, 'user@gmail.com');

    // 2
    final message = model.message;
    final avatarURL = model.avatarURL;
    final userEmail = model.userEmail;

    // 3
    expect(message, 'message');
    expect(avatarURL, 'url');
    expect(userEmail, 'user@gmail.com');
  });
}
