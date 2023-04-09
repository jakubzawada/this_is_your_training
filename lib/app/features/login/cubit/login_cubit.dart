import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          const LoginState(
            errorMessage: '',
            isCreatingAccount: false,
          ),
        );

  Future<void> createaccount({
    required String email,
    required String password,
  }) async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    emit(
      const LoginState(
        errorMessage: '',
        isCreatingAccount: true,
      ),
    );
  }

  Future<void> loginAccount({
    required String email,
    required String password,
  }) async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    emit(
      const LoginState(
        errorMessage: '',
        isCreatingAccount: false,
      ),
    );
  }
}
