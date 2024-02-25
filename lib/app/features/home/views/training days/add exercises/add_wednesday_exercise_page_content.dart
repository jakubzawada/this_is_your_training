import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/widgets/add%20exercise%20days/add_exercise_container.dart';
import 'package:this_is_your_training/widgets/add%20exercise%20days/name_exercise_textfield.dart';
import 'package:this_is_your_training/widgets/add%20exercise%20days/repeat_dropdownbutton.dart';
import 'package:this_is_your_training/widgets/add%20exercise%20days/series_dropdownbutton.dart';
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
                iconTheme: const IconThemeData(color: Colors.white),
                title: const Text(
                  'Add Exercise',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: Colors.white,
                  ),
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
                            child: NameExerciseTextField(
                              onChanged: (newValue) {
                                context
                                    .read<WednesdayExerciseCubit>()
                                    .uploadName2(newValue);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AddExerciseContainer(),
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
                                  child: SeriesDropdownButton(
                                    items: items,
                                    value: state.series2,
                                    onChanged: (newVal) {
                                      if (newVal != null) {
                                        context
                                            .read<WednesdayExerciseCubit>()
                                            .uploadSeries2(newVal);
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Center(
                                  child: RepeatDropdownButton(
                                    items2: items2,
                                    value: state.repeat2,
                                    onChanged: (newVal) {
                                      if (newVal != null) {
                                        context
                                            .read<WednesdayExerciseCubit>()
                                            .uploadRepeat2(newVal);
                                      }
                                    },
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
