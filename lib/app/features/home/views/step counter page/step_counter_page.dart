import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/views/step%20counter%20page/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/components/bar%20graph/bar_graph.dart';

class StepCounterScreen extends StatelessWidget {
  const StepCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Licznik Kroków'),
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
      color: Colors.white,
      child: Center(
        child: BlocBuilder<StepCounterCubit, StepCounterState>(
          builder: (context, state) {
            int goalSteps = 10000;
            double progress =
                (int.parse(state.stepCount) / goalSteps).clamp(0.0, 1.0);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Liczba kroków:',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  state.stepCount,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Wywołaj funkcję resetującą licznik kroków w StepCounterCubit
                    context.read<StepCounterCubit>().resetStepCount();
                  },
                  child: const Text('Resetuj licznik'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Spalone kalorie:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 10.0,
                    color: Colors.blue,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Text(
                  '${state.caloriesBurned} Kcal',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Przebyty dystans:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${state.distanceTraveled} Km',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
