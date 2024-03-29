import 'package:flutter_test/flutter_test.dart';
import 'package:this_is_your_training/models/post_extended_model.dart';

void main() {
  test('Creating a PostModel2 and downloading docs', () {
    // 1
    final model = PostModelExtended('avatarUrl', [], false);
    // 2
    final avatarUrl = model.avatarUrl;
    final isLiked = model.isLiked;
    // 3
    expect(avatarUrl, 'avatarUrl');
    expect(isLiked, false);
  });
}
