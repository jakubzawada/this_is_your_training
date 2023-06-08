import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/features/login/cubit/login_cubit.dart';
import 'package:this_is_your_training/app/features/login/forgot_pw_page.dart';
import 'package:this_is_your_training/components/square_tile.dart';
import 'package:this_is_your_training/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: BlocProvider(
        create: (context) => LoginCubit(),
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
                          isCreatingAccount == true
                              ? 'Zarejestruj się'
                              : 'Zaloguj się',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 28,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                        const SizedBox(height: 60),
                        TextField(
                          controller: widget.emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Email',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: widget.passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                  obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.deepPurple),
                            ),
                            hintText: 'Password',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          obscureText: obscureText,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
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
                            ),
                          ],
                        ),
                        Text(state.errorMessage),
                        const SizedBox(height: 20),
                        InkWell(
                          child: Container(
                            height: 60,
                            width: 320,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                isCreatingAccount == true
                                    ? 'Zarejestruj się'
                                    : 'Zaloguj się',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            if (isCreatingAccount == true) {
                              // rejestracja
                              try {
                                context.read<LoginCubit>().createaccount(
                                      email: widget.emailController.text,
                                      password: widget.passwordController.text,
                                      errorMessage: errorMessage,
                                    );
                              } catch (error) {
                                setState(() {
                                  errorMessage = error.toString();
                                });
                              }
                            } else {
                              // logowanie
                              try {
                                context.read<LoginCubit>().loginAccount(
                                      email: widget.emailController.text,
                                      password: widget.passwordController.text,
                                      errorMessage: errorMessage,
                                    );
                              } catch (error) {
                                setState(() {
                                  errorMessage = error.toString();
                                });
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isCreatingAccount == false) ...[
                              const Text(
                                'Dont\'t have an account?',
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 20),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isCreatingAccount = true;
                                  });
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
                            if (isCreatingAccount == true) ...[
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 20),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isCreatingAccount = false;
                                  });
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
                            // google button
                            SquareTile(
                              onTap: () => AuthService().signInWithGoogle(),
                              imagePath: 'images/google.png',
                            ),
                            const SizedBox(width: 20),
                            // apple button
                            SquareTile(
                              onTap: () {},
                              imagePath: 'images/apple.png',
                            ),
                            const SizedBox(width: 20),
                            // fb button
                            SquareTile(
                              onTap: () {},
                              imagePath: 'images/fb.png',
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
