import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExerciseButton extends StatelessWidget {
  const AddExerciseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 60,
          width: 370,
          color: const Color(0xFF232441),
          child: Center(
            child: Text(
              'Add Exercise',
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
