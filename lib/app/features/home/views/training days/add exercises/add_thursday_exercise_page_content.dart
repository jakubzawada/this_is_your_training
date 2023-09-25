import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/data/forum_data_sources/training_remote_data_source.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';
import 'cubit/thursday_exercise_cubit.dart';

class AddThursdayExercise extends StatelessWidget {
  AddThursdayExercise({Key? key}) : super(key: key);

  final List<String> items =
      List.generate(10, (index) => (index + 1).toString());

  final String? selectedItem = '3';

  final List<String> items2 =
      List.generate(40, (index) => (index + 1).toString());

  final String? selectedItem2 = '10';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThursdayExerciseCubit(
          TrainingsDocumentsRepository(TrainingsRemoteDataSource())),
      child: BlocListener<ThursdayExerciseCubit, ThursdayExerciseState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<ThursdayExerciseCubit, ThursdayExerciseState>(
          builder: (context, state) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                title: const Text(
                  'Dodaj ćwiczenie',
                ),
                centerTitle: true,
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 147, 90, 238),
                      Color.fromARGB(255, 111, 60, 193),
                      Color.fromARGB(255, 85, 40, 159),
                    ],
                  ),
                ),
                child: Center(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 120),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(60),
                              ],
                              style: GoogleFonts.inter(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Podaj nazwę ćwiczenia',
                                hintStyle: GoogleFonts.inter(
                                  fontSize: 22,
                                  letterSpacing: 1.8,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (newValue) {
                                context
                                    .read<ThursdayExerciseCubit>()
                                    .uploadName3(newValue);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60.0),
                                        child: Text(
                                          'Serie',
                                          style: GoogleFonts.bebasNeue(
                                            fontSize: 22,
                                            color: Colors.white,
                                            letterSpacing: 1.8,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 45.0),
                                        child: Text(
                                          'Powtórzenia',
                                          style: GoogleFonts.bebasNeue(
                                            fontSize: 22,
                                            color: Colors.white,
                                            letterSpacing: 1.8,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: 90,
                                    child: DropdownButtonFormField<int>(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                              width: 3,
                                              color: Color(0xFF232441),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        value: state.series3,
                                        dropdownColor:
                                            Colors.deepPurple.shade200,
                                        items: List.generate(
                                          items.length,
                                          (index) => DropdownMenuItem<int>(
                                            value: int.parse(items[index]),
                                            child: Text(items[index]),
                                          ),
                                        ),
                                        onChanged: (newVal) {
                                          context
                                              .read<ThursdayExerciseCubit>()
                                              .uploadSeries3(newVal!);
                                        }),
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Center(
                                  child: SizedBox(
                                    width: 90,
                                    child: DropdownButtonFormField<int>(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                              width: 3,
                                              color: Color(0xFF232441),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        value: state.repeat3,
                                        dropdownColor:
                                            Colors.deepPurple.shade200,
                                        items: List.generate(
                                          items2.length,
                                          (index) => DropdownMenuItem<int>(
                                            value: int.parse(items2[index]),
                                            child: Text(items2[index]),
                                          ),
                                        ),
                                        onChanged: (newVal) {
                                          context
                                              .read<ThursdayExerciseCubit>()
                                              .uploadRepeat3(newVal!);
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: (state.series3 != null &&
                                    state.repeat3 != null &&
                                    state.exerciseName3.isNotEmpty)
                                ? () {
                                    context
                                        .read<ThursdayExerciseCubit>()
                                        .addexercise(
                                          exerciseName: state.exerciseName3,
                                          repeat: state.repeat3!,
                                          series: state.series3!,
                                        );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF232441),
                              textStyle: GoogleFonts.bebasNeue(),
                            ),
                            child: const Text(
                              'Dodaj',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.8,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
