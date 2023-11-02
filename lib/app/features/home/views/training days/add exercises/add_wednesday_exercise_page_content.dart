import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'cubit/wednesday_exercise_cubit.dart';

class AddWednesdayExercise extends StatelessWidget {
  AddWednesdayExercise({Key? key}) : super(key: key);

  final List<String> items =
      List.generate(10, (index) => (index + 1).toString());

  final String? selectedItem = '3';

  final List<String> items2 =
      List.generate(40, (index) => (index + 1).toString());

  final String? selectedItem2 = '10';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WednesdayExerciseCubit>(
      create: (context) => getIt(),
      child: BlocListener<WednesdayExerciseCubit, WednesdayExerciseState>(
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
        child: BlocBuilder<WednesdayExerciseCubit, WednesdayExerciseState>(
          builder: (context, state) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                title: const Text(
                  'Add Exercise',
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
                      Color.fromARGB(255, 140, 74, 253),
                      Color.fromARGB(255, 134, 67, 250),
                      Color.fromARGB(255, 143, 78, 254),
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
                                hintText: 'Name the exercise',
                                hintStyle: GoogleFonts.inter(
                                  fontSize: 22,
                                  letterSpacing: 1.8,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (newValue) {
                                context
                                    .read<WednesdayExerciseCubit>()
                                    .uploadName2(newValue);
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
                                        value: state.series2,
                                        dropdownColor:
                                            Colors.deepPurple.shade200,
                                        items: <int>[
                                          1,
                                          2,
                                          3,
                                          4,
                                          5,
                                          6,
                                          7,
                                          8,
                                          9,
                                          10
                                        ].map((int value) {
                                          return DropdownMenuItem<int>(
                                            value: value,
                                            child: Text(value.toString()),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          context
                                              .read<WednesdayExerciseCubit>()
                                              .uploadSeries2(newVal!);
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
                                        value: state.repeat2,
                                        dropdownColor:
                                            Colors.deepPurple.shade200,
                                        items: <int>[
                                          1,
                                          2,
                                          3,
                                          4,
                                          5,
                                          6,
                                          7,
                                          8,
                                          9,
                                          10,
                                          11,
                                          12,
                                          13,
                                          14,
                                          15,
                                          16,
                                          17,
                                          18,
                                          19,
                                          20
                                        ].map((int value) {
                                          return DropdownMenuItem<int>(
                                            value: value,
                                            child: Text(value.toString()),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          context
                                              .read<WednesdayExerciseCubit>()
                                              .uploadRepeat2(newVal!);
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: (state.series2 != null &&
                                    state.repeat2 != null &&
                                    state.exerciseName2.isNotEmpty)
                                ? () {
                                    context
                                        .read<WednesdayExerciseCubit>()
                                        .addexercise(
                                          exerciseName: state.exerciseName2,
                                          repeat: state.repeat2!,
                                          series: state.series2!,
                                        );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF232441),
                              textStyle: GoogleFonts.bebasNeue(),
                            ),
                            child: const Text(
                              'Add',
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
