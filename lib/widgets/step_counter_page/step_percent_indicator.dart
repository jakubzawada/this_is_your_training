import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';

class StepsPercentIndicator extends StatelessWidget {
  const StepsPercentIndicator({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepCounterCubit, StepCounterState>(
      builder: (context, state) {
        int goalSteps = state.goalSteps;
        double progress =
            (int.parse(state.stepCount) / goalSteps).clamp(0.0, 1.0);
        return Stack(
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
        );
      },
    );
  }
}
