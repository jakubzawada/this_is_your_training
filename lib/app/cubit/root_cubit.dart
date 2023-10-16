import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/repositories/root_repository.dart';

part 'root_cubit.freezed.dart';
part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit({required this.rootRepository})
      : super(
          RootState(
            user: null,
          ),
        );

  final RootRepository rootRepository;

  StreamSubscription? _streamSubscription;

  Future<void> signOut() async {
    rootRepository.signOut();
  }

  Future<void> start() async {
    emit(
      RootState(
        user: null,
        status: Status.loading,
      ),
    );
    try {
      _streamSubscription = rootRepository.start().listen((user) {
        emit(
          RootState(
            user: user,
            status: Status.succes,
          ),
        );
      });
    } catch (error) {
      emit(
        RootState(
          user: null,
          status: Status.error,
          errorMessage: error.toString(),
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
