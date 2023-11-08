import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExerciseContainer extends StatelessWidget {
  const AddExerciseContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 340,
      decoration: BoxDecoration(
        color: const Color(0xFF232441),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 8)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Text(
              'Series',
              style: GoogleFonts.bebasNeue(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Text(
              'Repeats',
              style: GoogleFonts.bebasNeue(
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
