import 'package:eye_of_rovers/helpers/nasa_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return CupertinoPageScaffold(
      child: FutureBuilder<ImagesResponse>(
        future: NasaHelper.imagesBySol(rover: Rover.curiosity, sol: 1000),
        builder: (context, snap) {
          if (snap.hasData && snap.data != null) {
            return Text(snap.data.toString());
          }else if (snap.hasError) {
            return Center(child: Text(snap.error.toString()));
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
