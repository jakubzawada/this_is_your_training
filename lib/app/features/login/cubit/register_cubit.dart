import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(
          const RegisterState(
            isCreatingAccount: false,
            errorMessage: '',
          ),
        );

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
        RegisterState(
          isCreatingAccount: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }

}
