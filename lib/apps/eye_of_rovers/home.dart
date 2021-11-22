import 'package:eye_of_rovers/helpers/nasa_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: NasaHelper.imagesBySol('1000'),
        builder: (context, snap) {
          if (snap.hasData && snap.data != null) {
            return Text(snap.data.toString());
          }else if (snap.hasError) {
            return Text(snap.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
