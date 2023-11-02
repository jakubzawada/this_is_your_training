import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/friday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/monday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/saturday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/sunday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/thursday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/tuesday_page_content.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/wednesday_page_content.dart';

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
                          child: const ContainerUI('Monday'),
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
                          child: const ContainerUI('Tuesday'),
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
                          child: const ContainerUI('Wednesday'),
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
                          child: const ContainerUI('Thursday'),
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
                          child: const ContainerUI('Friday'),
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
                          child: const ContainerUI('Saturday'),
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
                          child: const ContainerUI('Sunday'),
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

class ContainerUI extends StatelessWidget {
  const ContainerUI(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
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
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 8)),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.white),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
