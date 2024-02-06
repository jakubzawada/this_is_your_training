import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/app.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'package:this_is_your_training/repositories/step_repository.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var status = await Permission.activityRecognition.status;

  if (status != PermissionStatus.granted) {
    await Permission.activityRecognition.request();
  }

  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StepCounterCubit>(
          create: (context) =>
              StepCounterCubit(stepRepository: StepRepository())
                ..initPedometer(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
