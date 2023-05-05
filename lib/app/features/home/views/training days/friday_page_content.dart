import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/friday_cubit.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
import 'add exercises/add_friday_exercise_page_content.dart';

class FridayPageContent extends StatelessWidget {
  const FridayPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Friday',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 375,
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                children: [
                  BlocProvider(
                    create: (context) => FridayCubit(DocumentsRepository())..start(),
                    child: BlocBuilder<FridayCubit, FridayState>(
                      builder: (context, state) {
                        if (state.errorMessage.isNotEmpty) {
                          return Center(
                            child: Text(
                              'Something went wrong:${state.errorMessage}',
                            ),
                          );
                        }

                        if (state.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final documentModels = state.documents;

                        return Container(
                          height: 520,
                          width: 375,
                          color: const Color(0xFF232441),
                          child: Column(
                            children: [
                              for (final documentModel in documentModels) ...[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Dismissible(
                                    background: Container(
                                      color: Colors.red,
                                      child: const Icon(Icons.delete),
                                    ),
                                    key: ValueKey(documentModel),
                                    onDismissed: (_) {
                                      context.read<FridayCubit>().dissmisible(
                                          documentid: documentModel.id);
                                    },
                                    child: Container(
                                      color: Colors.deepPurple,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              
                                              child: Text(
                                                
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                documentModel.name,
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.tealAccent,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              documentModel.series.toString(),
                                              style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.lightGreenAccent),
                                            ),
                                            Text(
                                              documentModel.repeat.toString(),
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.lightBlue,
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 100,
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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AddFridayExercise(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
