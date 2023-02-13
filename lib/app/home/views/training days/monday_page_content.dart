import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add exercises/add_monday_exercise_page_content.dart';

class MondayPageContent extends StatelessWidget {
  const MondayPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Monday',
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
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('trainings')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Something went wrong'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: Text("Loading"));
                        }

                        final documents = snapshot.data!.docs;

                        return Container(
                          height: 520,
                          width: 375,
                          color: const Color(0xFF232441),
                          child: Column(
                            children: [
                              for (final document in documents) ...[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Dismissible(
                                    background: Container(
                                      color: Colors.red,
                                      child: const Icon(Icons.delete),
                                    ),
                                    key: ValueKey(document.id),
                                    onDismissed: (_) {
                                      FirebaseFirestore.instance
                                          .collection('trainings')
                                          .doc(document.id)
                                          .delete();
                                    },
                                    child: Container(
                                      color: Colors.deepPurple,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              document['name'],
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.tealAccent,
                                              ),
                                            ),
                                            Text(
                                              document['series'].toString(),
                                              style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.lightGreenAccent),
                                            ),
                                            Text(
                                              document['repeat'].toString(),
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
                      }),
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
                    builder: (_) => const AddMondayExercise(),
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
