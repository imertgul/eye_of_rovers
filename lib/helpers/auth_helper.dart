import 'dart:async';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthRepository {
  //To make it singleton
  static final _instance = AuthRepository._();
  factory AuthRepository() => _instance;

  AuthRepository._() {
    _authStateController.add(LoginRequired()); //initial state
    checkAccessToken();
  }

  final StreamController<AuthState> _authStateController =
      StreamController<AuthState>();

  Stream<AuthState> get authStream => _authStateController.stream;

  Future<void> checkAccessToken() async {
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      _authStateController.add(LoggedIn());
    }
    _authStateController.add(LoginRequired());
  }

  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      _authStateController.add(LoggedIn());
    } else {
      _authStateController.add(LoginRequired());
      print(result.status);
      print(result.message);
      StateError(result.message ?? 'Unkown error');
    }
  }

  Future<void> logOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
    checkAccessToken();
  }
}

abstract class AuthState {}

class LoggedIn extends AuthState {}

class LoginRequired extends AuthState {}
