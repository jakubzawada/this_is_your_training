import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/login/cubit/login_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return TextField(
            controller: passwordController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  context.read<LoginCubit>().obscureText();
                },
                child: Icon(
                  state.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.deepPurple,
                ),
              ),
              hintText: 'Password',
              fillColor: Colors.grey[200],
              filled: true,
            ),
            obscureText: state.obscureText,
          );
        },
      ),
    );
  }
}
