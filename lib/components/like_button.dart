import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final void Function()? onTap;

  const LikeButton({
    Key? key,
    required this.isLiked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isLiked ? Icons.thumb_up_alt_sharp : Icons.thumb_up_off_alt_sharp,
        color: isLiked ? Colors.blue : Colors.grey,
      ),
    );
  }
}
