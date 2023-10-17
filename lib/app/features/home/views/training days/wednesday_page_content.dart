import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/wednesday_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'add exercises/add_wednesday_exercise_page_content.dart';

class WednesdayPageContent extends StatelessWidget {
  const WednesdayPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Wednesday',
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
              Color.fromARGB(255, 147, 90, 238),
              Color.fromARGB(255, 111, 60, 193),
              Color.fromARGB(255, 85, 40, 159),
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
                    Align(
                      alignment: Alignment.topCenter,
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
                                'Ćwiczenia',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              ),
                              Text(
                                'Serie',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1.8,
                                ),
                              ),
                              Text(
                                'Powtórzenia',
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
                    BlocProvider<WednesdayCubit>(
                      create: (context) => getIt()..start(),
                      child: BlocBuilder<WednesdayCubit, WednesdayState>(
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

                          return Container(
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
                                              .read<WednesdayCubit>()
                                              .dismissible(
                                                  documentid: documentModel.id);
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
                                                      style: GoogleFonts.inter(
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
                                                      style: GoogleFonts.inter(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 40,
                                                    child: Text(
                                                      documentModel.repeat
                                                          .toString(),
                                                      style: GoogleFonts.inter(
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
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 60,
                      width: 370,
                      color: const Color(0xFF232441),
                      child: Center(
                        child: Text(
                          'Dodaj Ćwiczenie',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AddWednesdayExercise(),
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
