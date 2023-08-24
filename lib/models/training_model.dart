import 'package:firebase_auth/firebase_auth.dart';

class TrainingModel {
  TrainingModel(
      {required this.name,
      required this.id,
      required this.series,
      required this.repeat,
      this.user});

  final String name;
  final String id;
  final int series;
  final int repeat;
  final User? user;

  factory TrainingModel.fromJson(Map<String, dynamic> json, String id) {
    return TrainingModel(
      name: json['name'],
      id: id,
      series: json['series'],
      repeat: json['repeat'],
    );
  }
}
