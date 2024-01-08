import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_shadow/flutter_icon_shadow.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/app/features/widgets/step_counter_page/dynamic_day_of_week.dart';
import 'package:this_is_your_training/app/features/widgets/step_counter_page/step_chart_page.dart';

class StepCounterScreen extends StatelessWidget {
  const StepCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const DynamicDayOfWeek(),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: BlocBuilder<StepCounterCubit, StepCounterState>(
        builder: (context, state) {
          return PageView(
            physics: const BouncingScrollPhysics(),
            children: const [
              FirstScreen(),
              StepChartPage(),
            ],
          );
        },
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 140, 74, 253),
            Color.fromARGB(255, 174, 133, 244),
            Colors.white,
          ],
        ),
      ),
      child: Center(
        child: BlocBuilder<StepCounterCubit, StepCounterState>(
          builder: (context, state) {
            int goalSteps = state.goalSteps;
            double progress =
                (int.parse(state.stepCount) / goalSteps).clamp(0.0, 1.0);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 110.0,
                      lineWidth: 22.0,
                      percent: progress,
                      backgroundColor: Colors.white,
                      circularStrokeCap: CircularStrokeCap.round,
                      maskFilter: const MaskFilter.blur(BlurStyle.solid, 8),
                      linearGradient: const LinearGradient(colors: [
                        Colors.deepPurpleAccent,
                        Color.fromARGB(255, 130, 58, 253),
                      ]),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Goal: ${state.goalSteps}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.stepCount,
                          style: const TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconShadow(
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.orangeAccent,
                        size: 80,
                      ),
                      shadowColor: Colors.redAccent,
                      shadowOffset: Offset(6, 6),
                    ),
                    SizedBox(width: 60),
                    IconShadow(
                      Icon(
                        Icons.location_on,
                        color: Colors.blueAccent,
                        size: 80,
                      ),
                      shadowColor: Colors.lightBlueAccent,
                      shadowOffset: Offset(6, 6),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.caloriesBurned} Kcal',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      '${state.distanceTraveled} Km',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    context.read<StepCounterCubit>().resetStepCount();
                  },
                  child: const Text(
                    'Resetuj licznik',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(4, 8)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.album_rounded,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Ustaw Cel kroków',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Kroczmy ku lepszemu zdrowiu\ni pełni samopoczucia!',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 230, 215, 215),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.deepPurple,
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                showSetGoalModel(context);
                              },
                              child: const Text(
                                'Ustaw Cel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void showSetGoalModel(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocBuilder<StepCounterCubit, StepCounterState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Wybierz nowy cel kroków:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButton<int>(
                  value: state.goalSteps,
                  onChanged: (newValue) {
                    context
                        .read<StepCounterCubit>()
                        .setGoalSteps(newValue ?? 0);
                  },
                  items: [5000, 6000, 7000, 8000, 9000, 10000]
                      .map((value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value kroków'),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Zapisz'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
