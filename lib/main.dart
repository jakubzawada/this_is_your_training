import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:this_is_your_training/app/app.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
