import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/app/features/widgets/step_counter_page/dynamic_day_of_week.dart';
import 'package:this_is_your_training/app/features/widgets/step_counter_page/step_chart_screen.dart';
import 'package:this_is_your_training/app/features/widgets/step_counter_page/step_counter_screen.dart';

class StepCounterPage extends StatelessWidget {
  const StepCounterPage({Key? key}) : super(key: key);

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (state.errorMessage.isNotEmpty)
                Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    StepCounterScreen(),
                    StepChartScreen(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
