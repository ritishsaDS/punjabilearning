import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_punjabilearning/bloc/AuthService.dart';
import 'package:flutter_punjabilearning/models/UserResults.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialLoginAuthBloc {
  final authService = AuthService();
  final googleSignIn = GoogleSignIn(scopes: ['email']);

  Stream<User> get currentUser => authService.currentUser;

  googleSignin() async {
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final results = await authService.signWithCrendential(credential);

      final userResults = UserResults(
          token: googleSignInAuthentication.idToken,
          profile: googleSignInAuthentication.accessToken);

      print('${results.user.displayName}');

      return userResults;
    } catch (error) {
      print(error);
    }
  }

  logOut() {
    authService.logOut();
  }
}
