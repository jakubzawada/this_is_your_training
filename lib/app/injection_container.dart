import 'package:get_it/get_it.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/forum_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/friday_exercise_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/monday_exercise_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/saturday_exercise_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/sunday_exercise_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/thursday_exercise_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/tuesday_exercise_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/wednesday_exercise_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/friday_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/monday_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/saturday_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/sunday_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/thursday_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/tuesday_cubit.dart';
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/wednesday_cubit.dart';
import 'package:this_is_your_training/app/features/login/cubit/login_cubit.dart';
import 'package:this_is_your_training/components/cubit/post_cubit.dart';
import 'package:this_is_your_training/data/data_sources/forum_remote_data_source.dart';
import 'package:this_is_your_training/data/data_sources/login_remote_data_source.dart';
import 'package:this_is_your_training/data/data_sources/my_account_remote_data_source.dart';
import 'package:this_is_your_training/data/data_sources/post_remote_data_source.dart';
import 'package:this_is_your_training/data/data_sources/training_remote_data_source.dart';
import 'package:this_is_your_training/repositories/forum_repository.dart';
import 'package:this_is_your_training/repositories/login_repository.dart';
import 'package:this_is_your_training/repositories/my_account_repository.dart';
import 'package:this_is_your_training/repositories/post_repository.dart';
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => ForumCubit(forumRepository: getIt()));
  getIt.registerFactory(() => MyAccountCubit(myAccountRepository: getIt()));

  getIt.registerFactory(() => FridayCubit(documentsRepository: getIt()));
  getIt.registerFactory(() => MondayCubit(documentsRepository: getIt()));
  getIt.registerFactory(() => SaturdayCubit(documentsRepository: getIt()));
  getIt.registerFactory(() => SundayCubit(documentsRepository: getIt()));
  getIt.registerFactory(() => ThursdayCubit(documentsRepository: getIt()));
  getIt.registerFactory(() => TuesdayCubit(documentsRepository: getIt()));
  getIt.registerFactory(() => WednesdayCubit(documentsRepository: getIt()));

  getIt
      .registerFactory(() => FridayExerciseCubit(documentsRepository: getIt()));
  getIt
      .registerFactory(() => MondayExerciseCubit(documentsRepository: getIt()));
  getIt.registerFactory(
      () => SaturdayExerciseCubit(documentsRepository: getIt()));
  getIt
      .registerFactory(() => SundayExerciseCubit(documentsRepository: getIt()));
  getIt.registerFactory(
      () => ThursdayExerciseCubit(documentsRepository: getIt()));
  getIt.registerFactory(
      () => TuesdayExerciseCubit(documentsRepository: getIt()));
  getIt.registerFactory(
      () => WednesdayExerciseCubit(documentsRepository: getIt()));

  getIt.registerFactory(() => LoginCubit(loginRepository: getIt()));
  getIt.registerFactory(() => PostCubit(postRepository: getIt()));

  // Repositories
  getIt.registerFactory(() => ForumRepository(forumdataSource: getIt()));
  getIt
      .registerFactory(() => MyAccountRepository(myAccountDataSource: getIt()));
  getIt.registerFactory(
      () => TrainingsDocumentsRepository(trainingsDataSource: getIt()));
  getIt.registerFactory(() => LoginRepository(loginDataSource: getIt()));
  getIt.registerFactory(() => PostRepository(postDataSource: getIt()));

  // DataSources
  getIt.registerFactory(() => ForumRemoteDataSource());
  getIt.registerFactory(() => LoginRemoteDataSource());
  getIt.registerFactory(() => MyAccountRemoteDataSource());
  getIt.registerFactory(() => PostRemoteDataSource());
  getIt.registerFactory(() => TrainingsRemoteDataSource());
}
