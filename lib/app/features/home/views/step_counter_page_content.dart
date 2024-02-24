import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_shadow/flutter_icon_shadow.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/step%20counter%20views/step_faq_page.dart';
import 'package:this_is_your_training/widgets/dynamic_day_of_week.dart';
import 'package:this_is_your_training/widgets/step_counter_page/set_step_goal_container.dart';
import 'package:this_is_your_training/app/features/home/views/step%20counter%20views/step_chart_page.dart';
import 'package:this_is_your_training/widgets/step_counter_page/step_counter_pause_button.dart';
import 'package:this_is_your_training/widgets/step_counter_page/step_counter_reset_button.dart';
import 'package:this_is_your_training/widgets/step_counter_page/step_percent_indicator.dart';

class StepCounterPage extends StatelessWidget {
  const StepCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StepFaqPage(),
                  ),
                );
              },
            ),
            const DynamicDayOfWeek(),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StepChartPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
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

              if (state.errorMessage.isNotEmpty) {
                Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepsPercentIndicator(progress: progress),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepCounterResetButton(),
                      SizedBox(width: 20),
                      StepCounterPauseButton(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SetStepGoalContainer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
