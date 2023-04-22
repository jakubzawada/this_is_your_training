import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
import 'cubit/thursday_exercise_cubit.dart';

class AddThursdayExercise extends StatefulWidget {
  const AddThursdayExercise({Key? key}) : super(key: key);

  @override
  State<AddThursdayExercise> createState() => _AddThursdayExerciseState();
}

class _AddThursdayExerciseState extends State<AddThursdayExercise> {
  var exerciseName3 = '';
  var series3 = 3;
  var repeat3 = 10;

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
      create: (context) => ThursdayExerciseCubit(DocumentsRepository()),
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
              backgroundColor: Colors.deepPurple,
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
              body: Center(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 120),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(42),
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
                                exerciseName3 = newValue;
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
                                width: 170,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF232441),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Serie',
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 22,
                                      color: Colors.white,
                                      letterSpacing: 1.8,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 70,
                                width: 170,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF232441),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Powtórzenia',
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 22,
                                      color: Colors.white,
                                      letterSpacing: 1.8,
                                    ),
                                  ),
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
                                      value: series3,
                                      dropdownColor: Colors.deepPurple.shade200,
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
                                          series3 = newVal!;
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
                                      value: repeat3,
                                      dropdownColor: Colors.deepPurple.shade200,
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
                                          repeat3 = newVal!;
                                        });
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: exerciseName3.isEmpty
                              ? null
                              : () {
                                  context
                                      .read<ThursdayExerciseCubit>()
                                      .addexercise(
                                        exerciseName: exerciseName3,
                                        repeat: repeat3,
                                        series: series3,
                                      );
                                },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF232441),
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
            );
          },
        ),
      ),
    );
  }
}
