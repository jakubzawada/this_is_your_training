import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się',
                style: GoogleFonts.bebasNeue(
                  fontSize: 28,
                  color: Colors.white,
                  letterSpacing: 1.8,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: widget.emailController,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 20,
                    letterSpacing: 1.8,
                    color: Colors.white,
                  ),
                ),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: InputDecoration(
                  hintText: 'Hasło',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 20,
                    letterSpacing: 1.8,
                    color: Colors.white,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    // rejestracja
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    // logowanie
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF232441),
                  textStyle: GoogleFonts.bebasNeue(),
                ),
                child: Text(
                  isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF40D876),
                    letterSpacing: 1.8,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isCreatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                  child: Text(
                    'Utwórz konto',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      letterSpacing: 1.8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: Text(
                    'Masz już konto',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      letterSpacing: 1.8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
