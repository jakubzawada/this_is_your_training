import 'package:firebase_auth/firebase_auth.dart';

class DocumentModel {
  DocumentModel(
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
}
