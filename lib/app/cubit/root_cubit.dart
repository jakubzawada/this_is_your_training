import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/repositories/auth_repository.dart';

part 'root_cubit.freezed.dart';
part 'root_state.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit({required this.authRepository})
      : super(
          RootState(
            user: null,
          ),
        );

  final AuthRepository authRepository;

  StreamSubscription? _streamSubscription;

  Future<void> signOut() async {
    try {
      authRepository.signOut();
    } catch (error) {
      emit(
        RootState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> start() async {
    emit(
      RootState(
        status: Status.loading,
        user: null,
      ),
    );
    try {
      _streamSubscription = authRepository.start().listen((user) {
        emit(
          RootState(
            status: Status.succes,
            user: user,
          ),
        );
      });
    } catch (error) {
      emit(
        RootState(
          status: Status.error,
          errorMessage: error.toString(),
          user: null,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
