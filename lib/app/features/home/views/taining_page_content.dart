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
      backgroundColor: Colors.deepPurple,
      body: ListView(
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
              const SizedBox(height: 40),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF232441),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Text(
                                'Poniedziałek',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF232441),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Text(
                                'Wtorek',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(0xFF40D876),
                                ),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF232441),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Text(
                                'Środa',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF232441),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Text(
                                'Czwartek',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(0xFF40D876),
                                ),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF232441),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Text(
                                'Piątek',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF232441),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Text(
                                'Sobota',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(0xFF40D876),
                                ),
                              ),
                            ),
                          ),
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
                          child: Container(
                            height: 80,
                            width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xFF232441),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(28.0),
                              child: Text(
                                'Niedziela',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
