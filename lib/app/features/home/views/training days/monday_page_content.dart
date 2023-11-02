import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/monday_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'add exercises/add_monday_exercise_page_content.dart';

class MondayPageContent extends StatelessWidget {
  const MondayPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Monday',
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        width: 370,
                        decoration: const BoxDecoration(
                          color: Color(0xFF232441),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Exercise',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              ),
                              Text(
                                'Series',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              ),
                              Text(
                                'Repeats',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocProvider<MondayCubit>(
                      create: (context) => getIt()..start(),
                      child: BlocBuilder<MondayCubit, MondayState>(
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
                            child: Container(
                              height: 520,
                              width: 370,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 35, 38, 97),
                                    Color.fromARGB(255, 42, 44, 87),
                                    Color(0xFF232441),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(4, 8)),
                                ],
                              ),
                              child: ListView(
                                children: [
                                  Column(
                                    children: [
                                      for (final documentModel
                                          in documentModels) ...[
                                        Dismissible(
                                          background: Container(
                                            color: Colors.red,
                                            child: const Icon(Icons.delete),
                                          ),
                                          key: ValueKey(documentModel),
                                          onDismissed: (_) {
                                            context
                                                .read<MondayCubit>()
                                                .dismissible(
                                                    documentid:
                                                        documentModel.id);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.deepPurpleAccent,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 220,
                                                      child: Text(
                                                        documentModel.name,
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                      child: Text(
                                                        documentModel.series
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                      child: Text(
                                                        documentModel.repeat
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width: 370,
                      color: const Color(0xFF232441),
                      child: Center(
                        child: Text(
                          'Add Exercise',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AddMondayExercise(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
