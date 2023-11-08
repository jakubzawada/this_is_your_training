import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NameExerciseTextField extends StatelessWidget {
  const NameExerciseTextField({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(60),
      ],
      style: GoogleFonts.inter(
        fontSize: 22,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: 'Name the exercise',
        hintStyle: GoogleFonts.inter(
          fontSize: 22,
          letterSpacing: 1.8,
          color: Colors.white,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
