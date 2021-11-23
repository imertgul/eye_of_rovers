import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthRepository {
  //To make it singleton
  static final _instance = AuthRepository._();
  factory AuthRepository() => _instance;

  AuthRepository._();

  Future<void> init() async {
    var app = await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else
      throw StateError('No access token for facebook auth');

    // Once signed in, return the UserCredential
  }
}
