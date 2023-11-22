import 'package:flutter/material.dart';

class SignInUpButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;

  const SignInUpButton(
      {Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.8,
            ),
          ),
        ),
      ),
    );
  }
}
