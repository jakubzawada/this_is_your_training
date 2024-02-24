import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/thursday_cubit.dart';
import 'package:this_is_your_training/widgets/training%20days/exercise_info_banner.dart';
import 'package:this_is_your_training/widgets/training%20days/thursday_page/thursday_exercise_container.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'package:this_is_your_training/widgets/training%20days/add_exercise_button.dart';
import 'add exercises/add_thursday_exercise_page_content.dart';

class ThursdayPageContent extends StatelessWidget {
  const ThursdayPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Thursday',
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
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ExerciseInfoBanner(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocProvider<ThursdayCubit>(
                      create: (context) => getIt()..start(),
                      child: BlocBuilder<ThursdayCubit, ThursdayState>(
                        builder: (context, state) {
                          if (state.errorMessage.isNotEmpty) {
                            return Container(
                              constraints: const BoxConstraints(maxWidth: 350),
                              child: Center(
                                child: Text(
                                  'Something went wrong: ${state.errorMessage}',
                                ),
                              ),
                            );
                          }

                          if (state.status == Status.loading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final documentModels = state.results;

                          return Expanded(
                            child: ThursdayExerciseContainer(
                                documentModels: documentModels),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: const AddExerciseButton(),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AddThursdayExercise(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
