import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final double radius;
  final String? avatarUrl;

  const ProfilePicture({
    super.key,
    required this.radius,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: avatarUrl != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(avatarUrl!),
              )
            : null,
      ),
    );
  }
}
