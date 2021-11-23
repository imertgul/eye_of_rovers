// ignore_for_file: prefer_const_constructors

import 'package:eye_of_rovers/repository/auth_repository.dart';
import 'package:eye_of_rovers/models/rover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apps/auth/login.dart';
import 'apps/gallery/gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthRepository().init(),
        builder: (context, snap) {
          if (snap.hasData && snap.data == true) {
            return CupertinoApp(
              title: 'Eye of rover',
              theme: const CupertinoThemeData(
                brightness: Brightness.light,
                primaryColor: CupertinoColors.systemBlue,
              ),
              localizationsDelegates: const [
                DefaultMaterialLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
              home: StreamBuilder<AuthState>(
                  stream: AuthRepository().authStream,
                  builder: (context, snap) {
                    if (snap.data is LoggedIn) {
                      return GalleryPage(
                        rovers: [
                          Curiosity(),
                          Spirit(),
                          Opportunity(),
                        ],
                      );
                    } else
                      return LoginPage();
                  }),
            );
          } else if (snap.hasError) {
            return Text(snap.error.toString());
          } else return Center(child: CupertinoActivityIndicator());
        });
  }
}
