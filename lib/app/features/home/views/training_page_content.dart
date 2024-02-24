import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/friday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/monday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/saturday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/sunday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/thursday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/tuesday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/wednesday_page_content.dart';
import 'package:this_is_your_training/widgets/training_page/training_days_container.dart';

class TrainingPageContent extends StatelessWidget {
  const TrainingPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 140, 74, 253),
              Color.fromARGB(255, 134, 67, 250),
              Color.fromARGB(255, 143, 78, 254),
            ],
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        'Your',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 32,
                          color: Colors.white,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        'Training',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 32,
                          color: const Color(0xFF40D876),
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          child: const TrainingDaysContainer('Monday'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const MondayPageContent(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: const TrainingDaysContainer('Tuesday'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const TuesdayPageContent(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: const TrainingDaysContainer('Wednesday'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const WednesdayPageContent(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: const TrainingDaysContainer('Thursday'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const ThursdayPageContent(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: const TrainingDaysContainer('Friday'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const FridayPageContent(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: const TrainingDaysContainer('Saturday'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const SaturdayPageContent(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          child: const TrainingDaysContainer('Sunday'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const SundayPageContent(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
