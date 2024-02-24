import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';

class StepCounterPauseButton extends StatelessWidget {
  const StepCounterPauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<StepCounterCubit>().togglePedometer();
      },
      backgroundColor: Colors.deepPurpleAccent,
      child: BlocBuilder<StepCounterCubit, StepCounterState>(
        builder: (context, state) {
          return Icon(
            state.isPedometerActive
                ? Icons.pause_circle_filled
                : Icons.play_circle_fill_outlined,
            color: Colors.white,
          );
        },
      ),
    );
  }
}
