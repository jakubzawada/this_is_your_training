import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMondayExercise extends StatefulWidget {
  const AddMondayExercise({Key? key}) : super(key: key);

  @override
  State<AddMondayExercise> createState() => _AddMondayExerciseState();
}

class _AddMondayExerciseState extends State<AddMondayExercise> {
  var exerciseName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  const InputDecoration(hintText: 'Podaj nazwę ćwiczenia'),
              onChanged: (newValue) {
                setState(() {
                  exerciseName = newValue;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('trainings').add({
                    'name': exerciseName,
                    'series': 3,
                    'repeat': 10,
                  });
                },
                child: const Text('Dodaj'))
          ],
        ),
      ),
    );
  }
}
