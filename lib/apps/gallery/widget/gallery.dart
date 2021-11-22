
import 'package:eye_of_rovers/helpers/nasa_helper.dart';
import 'package:eye_of_rovers/models/rover.dart';
import 'package:flutter/cupertino.dart';

class Gallery extends StatelessWidget {
  final Rover rover;
  const Gallery({Key? key, required this.rover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhotosResponse>(
      future: NasaHelper.imagesBySol(rover: rover, sol: 1000),
      builder: (context, snap) {
        if (snap.hasData && snap.data != null) {
          return Text(snap.data.toString());
        } else if (snap.hasError) {
          return Center(child: Text(snap.error.toString()));
        }
        return const Center(child: CupertinoActivityIndicator());
      },
    );
  }
}