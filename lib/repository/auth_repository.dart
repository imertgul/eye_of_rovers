import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthRepository {
  //To make it singleton to access anywhere
  static final _instance = AuthRepository._();
  factory AuthRepository() => _instance;

  AuthRepository._() {
    _authStateController.add(LoginRequired()); //initial state
  }

  final StreamController<AuthState> _authStateController =
      StreamController<AuthState>();

  Stream<AuthState> get authStream => _authStateController.stream;

  Future<bool> init() async {
    try {
      var app = await Firebase.initializeApp();
      FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);
      auth.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
          _authStateController.add(LoginRequired());
        } else {
          print('User is signed in!');
          _authStateController.add(LoggedIn());
        }
      });
      return true;
    } on Exception catch (e) {
      throw StateError(e.toString());
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        //save auth token to see public infos of user
        await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        StateError(result.message ?? 'Unkown error');
      }
    } on Exception catch (e) {
      StateError(e.toString());
    }
  }

  Future<void> logOutFromFacebook() async {
    FirebaseAuth.instance.signOut();
  }
}

abstract class AuthState {}

class LoggedIn extends AuthState {}

class LoginRequired extends AuthState {}
