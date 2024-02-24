import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepFaqPage extends StatelessWidget {
  const StepFaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 140, 74, 253),
              Color.fromARGB(255, 174, 133, 244),
              Colors.white,
            ],
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                'FAQ',
                style: GoogleFonts.bebasNeue(
                  fontSize: 50,
                  color: Colors.black,
                  letterSpacing: 1.8,
                ),
              ),
            ),
            const FaqTile(
              question: 'Counting while driving?',
              answer:
                  'Sometimes while driving a car or other means of transportation, the system may read steps, due to system limitations.\n\n'
                  'We recommend that you use the PAUSE button to pause the step counter while riding on means of transportation.',
            ),
            const FaqTile(
              question: 'Counting while shaking the phone?',
              answer:
                  'Counting steps while shaking the phone is caused by the phones built-in motion sensor. ',
            ),
            const FaqTile(
              question: 'Resetting the counter after restarting the phone?',
              answer: 'Step counter uses built-in sensors.\n\n'
                  'Data is stored temporarily in the devices memory, so when the phone is restarted, this data is cleared, resetting the step counter. \n\n'
                  'We are constantly working to resolve this issue. We apologize for any related inconvenience',
            ),
            const FaqTile(
              question:
                  'The number of steps does not read into the step chart?',
              answer:
                  'Data on steps, are read into the database when using the application. \n\n'
                  'In order for the data to read correctly into the step chart, we recommend firing up the application. \n\n'
                  'We are constantly working to resolve this issue. We apologize for any related inconvenience',
            ),
            const FaqTile(
              question: 'What is the accuracy of the step counter?',
              answer:
                  'We use the phones built-in sensor, which uses sensors to track movement and determine the number of steps. ',
            ),
            const FaqTile(
              question: 'Calories burned and distance traveled',
              answer:
                  'We currently calculate calories burned and distance traveled by averaging the data for an average person. \n\n'
                  'We are constantly working to add calculation of calories burned and distance traveled based on, weight setting and height',
            ),
          ],
        ),
      ),
    );
  }
}

class FaqTile extends StatefulWidget {
  final String question;
  final String answer;

  const FaqTile({
    required this.question,
    required this.answer,
    Key? key,
  }) : super(key: key);

  @override
  FaqTileState createState() => FaqTileState();
}

class FaqTileState extends State<FaqTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          title: Text(
            widget.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          trailing: _isExpanded
              ? const Icon(Icons.keyboard_arrow_up)
              : const Icon(Icons.keyboard_arrow_down),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.answer,
            ),
          ),
      ],
    );
  }
}
