import 'package:flutter/material.dart';

class PostTextField extends StatelessWidget {
  const PostTextField({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: 'Write something on the forum..',
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.grey[300],
      ),
      obscureText: false,
    );
  }
}
