import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_shadow/flutter_icon_shadow.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:this_is_your_training/app/features/home/views/step%20counter%20page/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/components/bar%20graph/bar_graph.dart';

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
              SecondScreen(),
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
            int goalSteps = 6000;
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
                        const Text(
                          'Goal: 6000',
                          style: TextStyle(
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
                                _showSetGoalModal(context);
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

void _showSetGoalModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      // Tutaj możesz dostosować zawartość półeczkowego ekranu
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Wybierz nowy cel kroków:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // DropdownButton do wybierania celu
            DropdownButton<int>(
              value: context.read<StepCounterCubit>().goalSteps,
              onChanged: (newValue) {
                context.read<StepCounterCubit>().setGoalSteps(newValue ?? 0);
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
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<StepCounterCubit>().loadWeeklySummaryFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Wystąpił błąd: ${snapshot.error}');
        } else {
          List<double> weeklySummary = snapshot.data as List<double>;

          return Container(
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 300,
                child: MyBarGraph(
                  weeklySummary: weeklySummary,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class DynamicDayOfWeek extends StatelessWidget {
  const DynamicDayOfWeek({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String dayOfWeek =
        DateFormat('EEEE', Localizations.localeOf(context).toString())
            .format(now);

    return Center(
      child: Text(
        dayOfWeek,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
