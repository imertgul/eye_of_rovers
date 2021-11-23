import 'package:eye_of_rovers/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
            child: const Text('Login with Facebook'),
            onPressed: () {
              AuthRepository().signInWithFacebook();
            }),
      ),
    );
  }
}
