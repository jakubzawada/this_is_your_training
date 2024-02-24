import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';

class SetStepGoalContainer extends StatelessWidget {
  const SetStepGoalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Set a Step Goal',
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
              'Let s move toward better health\nand well-being!',
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
                    'Set Goal',
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
    );
  }
}

Future<void> showSetGoalModel(BuildContext context) async {
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
                  'Choose a new step goal:',
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
                            child: Text('$value steps'),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      );
    },
  );
}
