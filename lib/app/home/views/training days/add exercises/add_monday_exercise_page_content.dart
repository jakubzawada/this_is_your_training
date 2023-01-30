import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMondayExercise extends StatefulWidget {
  const AddMondayExercise({Key? key}) : super(key: key);

  @override
  State<AddMondayExercise> createState() => _AddMondayExerciseState();
}

class _AddMondayExerciseState extends State<AddMondayExercise> {
  var exerciseName = '';
  var series = 3;
  var repeat = 10;

  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '6',
    '8',
  ];
  String? selectedItem = '3';
  List<String> items2 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];
  String? selectedItem2 = '10';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration:
                    const InputDecoration(hintText: 'Podaj nazwę ćwiczenia'),
                onChanged: (newValue) {
                  setState(() {
                    exerciseName = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 110,
                    color: Colors.blue,
                    child: const Center(child: Text('Serie')),
                  ),
                  Container(
                    height: 70,
                    width: 110,
                    color: Colors.white,
                    child: const Center(child: Text('Powtórzenia')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<int>(
                      hint: const Text("Pcik"),
                      value: series,
                      items:
                          <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          series = newVal!;
                        });
                      }),
                  const SizedBox(width: 40),
                  DropdownButton<int>(
                      hint: const Text("Pcik"),
                      value: repeat,
                      items:
                          <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          repeat = newVal!;
                        });
                      }),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('trainings').add({
                  'name': exerciseName,
                  'series': series,
                  'repeat': repeat,
                });
              },
              child: const Text('Dodaj'),
            )
          ],
        ),
      ),
    );
  }
}
