import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FridayPageContent extends StatelessWidget {
  const FridayPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
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
                              color: Colors.white54,
                              letterSpacing: 1.8,
                            ),
                          ),
                          Text(
                            'Serie',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                              color: Colors.white54,
                              letterSpacing: 1.8,
                            ),
                          ),
                          Text(
                            'Powtórzenia',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                              color: Colors.white54,
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
                  Container(
                    height: 500,
                    width: 375,
                    color: const Color(0xFF232441),
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
                        color: Colors.white54,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
