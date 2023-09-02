import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  //Google Sign In
  signInWithGoogle() async {
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Facebook Sign In
  signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        return await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        print('Facebook login failed. Status: ${result.status}');
        return null;
      }
    } catch (e) {
      print('Error during Facebook login: $e');
      return null;
    }
  }
}
