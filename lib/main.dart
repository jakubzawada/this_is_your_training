import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/app.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'package:this_is_your_training/data/data_sources/root_remote_data_source.dart';
import 'package:this_is_your_training/repositories/root_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
    create: (context) => RootCubit(
        rootRepository: RootRepository(rootdataSource: RootDataSource())),
    child: const MyApp(),
  ));
}
