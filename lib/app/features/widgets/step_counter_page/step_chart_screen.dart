import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/components/bar%20graph/bar_graph.dart';

class StepChartScreen extends StatelessWidget {
  const StepChartScreen({super.key});

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
              child: SizedBox(
                height: 600,
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
