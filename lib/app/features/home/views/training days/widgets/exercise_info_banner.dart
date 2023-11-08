import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseInfoBanner extends StatelessWidget {
  const ExerciseInfoBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 370,
      decoration: const BoxDecoration(
        color: Color(0xFF232441),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Exercise',
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
            Text(
              'Series',
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
            Text(
              'Repeats',
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
