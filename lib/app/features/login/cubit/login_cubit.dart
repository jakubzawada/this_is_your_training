import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          const LoginState(
            isCreatingAccount: false,
            errorMessage: '',
          ),
        );

  Future<void> obscureText({required bool obscureText}) async {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  Future<void> tooglAccountCreate(bool isCreatingAccount) async {
    emit(
      const LoginState(isCreatingAccount: true, errorMessage: ''),
    );
  }

  Future<void> tooglAccountLogin(bool isCreatingAccount) async {
    emit(
      const LoginState(isCreatingAccount: false, errorMessage: ''),
    );
  }

  Future<void> loginAccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        LoginState(
          isCreatingAccount: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> createaccount({
    required String email,
    required String password,
    required String errorMessage,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        LoginState(
          isCreatingAccount: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
