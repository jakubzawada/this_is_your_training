import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMondayExercise extends StatefulWidget {
  const AddMondayExercise({Key? key}) : super(key: key);

  @override
  State<AddMondayExercise> createState() => _AddMondayExerciseState();
}

class _AddMondayExerciseState extends State<AddMondayExercise> {
  var exerciseName = '';
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.blue),
                            ),
                          ),
                          value: selectedItem,
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(fontSize: 24)),
                                  ))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedItem = item),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.blue),
                            ),
                          ),
                          value: selectedItem2,
                          items: items2
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(fontSize: 24)),
                                  ))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedItem2 = item),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
