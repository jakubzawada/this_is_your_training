import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
import 'cubit/friday_exercise_cubit.dart';

class AddFridayExercise extends StatefulWidget {
  const AddFridayExercise({Key? key}) : super(key: key);

  @override
  State<AddFridayExercise> createState() => _AddFridayExerciseState();
}

class _AddFridayExerciseState extends State<AddFridayExercise> {
  var exerciseName4 = '';
  var series4 = 3;
  var repeat4 = 10;

  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '6',
    '8',
  ];
  String? selectedItem = '3';
  List<String> items2 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];
  String? selectedItem2 = '10';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FridayExerciseCubit(DocumentsRepository()),
      child: BlocListener<FridayExerciseCubit, FridayExerciseState>(
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
        child: BlocBuilder<FridayExerciseCubit, FridayExerciseState>(
          builder: (context, state) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                title: const Text(
                  'Dodaj Ćwiczenie',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
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
                                setState(() {
                                  exerciseName4 = newValue;
                                });
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
                                        value: series4,
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
                                          setState(() {
                                            series4 = newVal!;
                                          });
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
                                        value: repeat4,
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
                                          setState(() {
                                            repeat4 = newVal!;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: exerciseName4.isEmpty
                                ? null
                                : () {
                                    context
                                        .read<FridayExerciseCubit>()
                                        .addexercise(
                                          exerciseName: exerciseName4,
                                          repeat: repeat4,
                                          series: series4,
                                        );
                                  },
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
