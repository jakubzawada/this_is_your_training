import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/app.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'package:this_is_your_training/components/cubit/post_cubit.dart';
import 'package:this_is_your_training/data/forum_data_sources/post_remote_data_source.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
    create: (context) => RootCubit(),
    child: BlocProvider(
      create: (context) => PostCubit(PostRepository(PostRemoteDataSource())),
      child: const MyApp(),
    ),
  ));
}
