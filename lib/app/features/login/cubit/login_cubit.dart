import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:this_is_your_training/repositories/login_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController passwordController;

  LoginCubit(this._loginRepository, {required this.passwordController})
      : super(
          LoginState(
            isCreatingAccount: false,
            errorMessage: '',
            password: '',
          ),
        );

  final LoginRepository _loginRepository;

  Future<void> obscureText() async {
    emit(state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    ));
  }

  Future<void> tooglAccountCreate(bool isCreatingAccount) async {
    emit(
      LoginState(isCreatingAccount: true, errorMessage: '', password: ''),
    );
  }

  Future<void> tooglAccountLogin(bool isCreatingAccount) async {
    emit(
      LoginState(isCreatingAccount: false, errorMessage: '', password: ''),
    );
  }

  Future<void> loginAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    try {
      await _loginRepository.loginAccount(
          email: email, password: password, errorMessage: errorMessage);
    } catch (error) {
      passwordController.clear();
      emit(
        LoginState(
          isCreatingAccount: false,
          errorMessage: error.toString(),
          password: '',
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
      await _loginRepository.createAccount(
          email: email, password: password, errorMessage: errorMessage);
    } catch (error) {
      passwordController.clear();
      emit(
        LoginState(
          isCreatingAccount: false,
          errorMessage: error.toString(),
          password: '',
        ),
      );
    }
  }
}
