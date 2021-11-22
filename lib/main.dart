import 'package:eye_of_rovers/models/rover.dart';
import 'package:flutter/cupertino.dart';

import 'apps/gallery/gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CupertinoApp(
      title: 'Eye of rover',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: GalleryPage(
        rovers: [
          Curiosity(),
          Spirit(),
          Opportunity(),
        ],
      ),
    );
  }
}
