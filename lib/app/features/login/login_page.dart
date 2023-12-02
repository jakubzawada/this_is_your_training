import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/features/login/cubit/login_cubit.dart';
import 'package:this_is_your_training/app/features/login/widgets/forgot_password_button.dart';
import 'package:this_is_your_training/app/features/login/widgets/sign_in_up_button.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'package:this_is_your_training/components/square_tile.dart';
import 'package:this_is_your_training/services/auth_service.dart';
import 'package:this_is_your_training/app/features/login/widgets/email_textfield.dart';
import 'package:this_is_your_training/app/features/login/widgets/password_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 180, 245),
      body: BlocProvider<LoginCubit>(
        create: (context) => getIt(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          state.isCreatingAccount == true
                              ? 'Sign up'
                              : 'Sign in ',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 32,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                        const SizedBox(height: 60),
                        EmailTextField(emailController: emailController),
                        const SizedBox(height: 20),
                        PasswordTextField(
                            passwordController: passwordController),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ForgotPasswordButton(),
                          ],
                        ),
                        if (state.errorMessage.isNotEmpty)
                          Text(state.errorMessage),
                        const SizedBox(height: 20),
                        SignInUpButton(
                          buttonText: state.isCreatingAccount == true
                              ? 'Sign up'
                              : 'Sign in',
                          onTap: () async {
                            if (state.isLoggingIn) {
                              return;
                            }
                            try {
                              if (state.isCreatingAccount == true) {
                                await context.read<LoginCubit>().createAccount(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                      errorMessage: state.errorMessage,
                                    );
                              } else {
                                await context.read<LoginCubit>().loginAccount(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                      errorMessage: state.errorMessage,
                                    );
                              }
                            } catch (error) {
                              error.toString();
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.isCreatingAccount == false) ...[
                              const Text(
                                'Dont\'t have an account?',
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 20),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<LoginCubit>().tooglAccountCreate(
                                      state.isCreatingAccount);
                                },
                                child: const Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            if (state.isCreatingAccount == true) ...[
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 20),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<LoginCubit>().tooglAccountLogin(
                                      state.isCreatingAccount);
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SquareTile(
                              onTap: () => AuthService().signInWithGoogle(),
                              imagePath: 'images/google.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
