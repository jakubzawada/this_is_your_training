// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:this_is_your_training/app/cubit/root_cubit.dart' as _i13;
import 'package:this_is_your_training/app/features/home/views/cubit/forum_cubit.dart'
    as _i17;
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart'
    as _i19;
import 'package:this_is_your_training/app/features/home/views/cubit/step_counter_cubit.dart'
    as _i21;
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/friday_exercise_cubit.dart'
    as _i28;
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/monday_exercise_cubit.dart'
    as _i30;
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/saturday_exercise_cubit.dart'
    as _i32;
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/sunday_exercise_cubit.dart'
    as _i34;
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/thursday_exercise_cubit.dart'
    as _i36;
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/tuesday_exercise_cubit.dart'
    as _i24;
import 'package:this_is_your_training/app/features/home/views/training%20days/add%20exercises/cubit/wednesday_exercise_cubit.dart'
    as _i26;
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/friday_cubit.dart'
    as _i27;
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/monday_cubit.dart'
    as _i29;
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/saturday_cubit.dart'
    as _i31;
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/sunday_cubit.dart'
    as _i33;
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/thursday_cubit.dart'
    as _i35;
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/tuesday_cubit.dart'
    as _i23;
import 'package:this_is_your_training/app/features/home/views/training%20days/cubit/wednesday_cubit.dart'
    as _i25;
import 'package:this_is_your_training/app/features/login/cubit/login_cubit.dart'
    as _i18;
import 'package:this_is_your_training/components/cubit/post_cubit.dart' as _i20;
import 'package:this_is_your_training/data/data_sources/auth_remote_data_source.dart'
    as _i3;
import 'package:this_is_your_training/data/data_sources/forum_remote_data_source.dart'
    as _i5;
import 'package:this_is_your_training/data/data_sources/login_remote_data_source.dart'
    as _i7;
import 'package:this_is_your_training/data/data_sources/my_account_remote_data_source.dart'
    as _i9;
import 'package:this_is_your_training/data/data_sources/post_remote_data_source.dart'
    as _i11;
import 'package:this_is_your_training/data/data_sources/step_remote_data_source.dart'
    as _i15;
import 'package:this_is_your_training/data/data_sources/training_remote_data_source.dart'
    as _i16;
import 'package:this_is_your_training/repositories/auth_repository.dart' as _i4;
import 'package:this_is_your_training/repositories/forum_repository.dart'
    as _i6;
import 'package:this_is_your_training/repositories/login_repository.dart'
    as _i8;
import 'package:this_is_your_training/repositories/my_account_repository.dart'
    as _i10;
import 'package:this_is_your_training/repositories/post_repository.dart'
    as _i12;
import 'package:this_is_your_training/repositories/step_repository.dart'
    as _i14;
import 'package:this_is_your_training/repositories/trainings_documents_repository.dart'
    as _i22;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthDataSource>(() => _i3.AuthDataSource());
    gh.factory<_i4.AuthRepository>(
        () => _i4.AuthRepository(authdataSource: gh<_i3.AuthDataSource>()));
    gh.factory<_i5.ForumRemoteDataSource>(() => _i5.ForumRemoteDataSource());
    gh.factory<_i6.ForumRepository>(() =>
        _i6.ForumRepository(forumdataSource: gh<_i5.ForumRemoteDataSource>()));
    gh.factory<_i7.LoginRemoteDataSource>(() => _i7.LoginRemoteDataSource());
    gh.factory<_i8.LoginRepository>(() =>
        _i8.LoginRepository(loginDataSource: gh<_i7.LoginRemoteDataSource>()));
    gh.factory<_i9.MyAccountRemoteDataSource>(
        () => _i9.MyAccountRemoteDataSource());
    gh.factory<_i10.MyAccountRepository>(() => _i10.MyAccountRepository(
        myAccountDataSource: gh<_i9.MyAccountRemoteDataSource>()));
    gh.factory<_i11.PostRemoteDataSource>(() => _i11.PostRemoteDataSource());
    gh.factory<_i12.PostRepository>(() =>
        _i12.PostRepository(postDataSource: gh<_i11.PostRemoteDataSource>()));
    gh.factory<_i13.RootCubit>(
        () => _i13.RootCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i14.StepRepository>(() => _i14.StepRepository(
        stepRemoteDataSource: gh<_i15.StepRemoteDataSource>()));
    gh.factory<_i16.TrainingsRemoteDataSource>(
        () => _i16.TrainingsRemoteDataSource());
    gh.factory<_i17.ForumCubit>(
        () => _i17.ForumCubit(forumRepository: gh<_i6.ForumRepository>()));
    gh.factory<_i18.LoginCubit>(
        () => _i18.LoginCubit(loginRepository: gh<_i8.LoginRepository>()));
    gh.factory<_i19.MyAccountCubit>(() => _i19.MyAccountCubit(
        myAccountRepository: gh<_i10.MyAccountRepository>()));
    gh.factory<_i20.PostCubit>(
        () => _i20.PostCubit(postRepository: gh<_i12.PostRepository>()));
    gh.factory<_i21.StepCounterCubit>(
        () => _i21.StepCounterCubit(stepRepository: gh<_i14.StepRepository>()));
    gh.factory<_i22.TrainingsDocumentsRepository>(() =>
        _i22.TrainingsDocumentsRepository(
            trainingsDataSource: gh<_i16.TrainingsRemoteDataSource>()));
    gh.factory<_i23.TuesdayCubit>(() => _i23.TuesdayCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i24.TuesdayExerciseCubit>(() => _i24.TuesdayExerciseCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i25.WednesdayCubit>(() => _i25.WednesdayCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i26.WednesdayExerciseCubit>(() => _i26.WednesdayExerciseCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i27.FridayCubit>(() => _i27.FridayCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i28.FridayExerciseCubit>(() => _i28.FridayExerciseCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i29.MondayCubit>(() => _i29.MondayCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i30.MondayExerciseCubit>(() => _i30.MondayExerciseCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i31.SaturdayCubit>(() => _i31.SaturdayCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i32.SaturdayExerciseCubit>(() => _i32.SaturdayExerciseCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i33.SundayCubit>(() => _i33.SundayCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i34.SundayExerciseCubit>(() => _i34.SundayExerciseCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i35.ThursdayCubit>(() => _i35.ThursdayCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    gh.factory<_i36.ThursdayExerciseCubit>(() => _i36.ThursdayExerciseCubit(
        documentsRepository: gh<_i22.TrainingsDocumentsRepository>()));
    return this;
  }
}
