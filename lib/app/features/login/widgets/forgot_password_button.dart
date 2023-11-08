import 'package:flutter/material.dart';
import 'package:this_is_your_training/app/features/login/forgot_pw_page.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ForgotPasswordPage();
            },
          ),
        );
      },
      child: const Text(
        'Forgot Passowrd?',
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
