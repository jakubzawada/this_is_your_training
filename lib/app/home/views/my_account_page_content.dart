import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/tapeta1.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFF232441),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Text(
                'Jesteś zalogowany jako $email',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: Colors.white,
                  letterSpacing: 1.8,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF232441),
                textStyle: GoogleFonts.bebasNeue(),
              ),
              child: const Text(
                'Wyloguj',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                  letterSpacing: 1.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
