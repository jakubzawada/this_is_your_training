import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:this_is_your_training/app/core/enums.dart';
import 'package:this_is_your_training/repositories/login_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController? passwordController;
  LoginCubit({required this.loginRepository, this.passwordController})
      : super(
          LoginState(),
        );

  final LoginRepository loginRepository;

  Future<void> obscureText() async {
    emit(LoginState(obscureText: !state.obscureText));
  }

  Future<void> tooglAccountCreate(bool isCreatingAccount) async {
    emit(
      LoginState(
        isCreatingAccount: true,
      ),
    );
  }

  Future<void> tooglAccountLogin(bool isCreatingAccount) async {
    emit(
      LoginState(
        isCreatingAccount: false,
      ),
    );
  }

  Future<void> loginAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    try {
      await loginRepository.loginAccount(
          email: email, password: password, errorMessage: errorMessage);
    } catch (error) {
      passwordController?.clear();
      emit(
        LoginState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    try {
      await loginRepository.createAccount(
          email: email, password: password, errorMessage: errorMessage);
    } catch (error) {
      passwordController?.clear();
      emit(
        LoginState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
