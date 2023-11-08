import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/saturday_cubit.dart';
import 'package:this_is_your_training/models/training_model.dart';

class SaturdayExerciseContainer extends StatelessWidget {
  const SaturdayExerciseContainer({
    super.key,
    required this.documentModels,
  });

  final List<TrainingModel> documentModels;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      width: 370,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 35, 38, 97),
            Color.fromARGB(255, 42, 44, 87),
            Color(0xFF232441),
          ],
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 8)),
        ],
      ),
      child: ListView(
        children: [
          Column(
            children: [
              for (final documentModel in documentModels) ...[
                Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  key: ValueKey(documentModel),
                  onDismissed: (_) {
                    context
                        .read<SaturdayCubit>()
                        .dismissible(documentid: documentModel.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 220,
                              child: Text(
                                documentModel.name,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                documentModel.series.toString(),
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                documentModel.repeat.toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
