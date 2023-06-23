import 'package:flutter/material.dart';

class MakroPageContent extends StatefulWidget {
  const MakroPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<MakroPageContent> createState() => _MakroPageContentState();
}

class _MakroPageContentState extends State<MakroPageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 154, 104, 236),
              Color.fromARGB(255, 111, 60, 193),
              Colors.deepPurple,
            ],
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
