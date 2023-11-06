// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  //Google Sign In
  Future<void> signInWithGoogle() async {
    //
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Facebook Sign In
  Future<void> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        print('Facebook login failed. Status: ${result.status}');
        return;
      }
    } catch (error) {
      print('Error during Facebook login: $error');
      return;
    }
  }
}
