import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/widgets/add_exercise_container.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/widgets/name_exercise_textfield.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/widgets/repeat_dropdownbutton.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/widgets/series_dropdownbutton.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'cubit/friday_exercise_cubit.dart';

class AddFridayExercise extends StatelessWidget {
  AddFridayExercise({Key? key}) : super(key: key);

  final List<String> items =
      List.generate(10, (index) => (index + 1).toString());

  final String? selectedItem = '3';

  final List<String> items2 =
      List.generate(40, (index) => (index + 1).toString());

  final String? selectedItem2 = '10';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FridayExerciseCubit>(
      create: (context) => getIt(),
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
                            child: NameExerciseTextField(
                              onChanged: (newValue) {
                                context
                                    .read<FridayExerciseCubit>()
                                    .uploadName4(newValue);
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
                                    value: state.series4,
                                    onChanged: (newVal) {
                                      if (newVal != null) {
                                        context
                                            .read<FridayExerciseCubit>()
                                            .uploadSeries4(newVal);
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Center(
                                  child: RepeatDropdownButton(
                                    items2: items2,
                                    value: state.repeat4,
                                    onChanged: (newVal) {
                                      if (newVal != null) {
                                        context
                                            .read<FridayExerciseCubit>()
                                            .uploadRepeat4(newVal);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: (state.series4 != null &&
                                    state.repeat4 != null &&
                                    state.exerciseName4.isNotEmpty)
                                ? () {
                                    context
                                        .read<FridayExerciseCubit>()
                                        .addexercise(
                                          exerciseName: state.exerciseName4,
                                          repeat: state.repeat4!,
                                          series: state.series4!,
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
