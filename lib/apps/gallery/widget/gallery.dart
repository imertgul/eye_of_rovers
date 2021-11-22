import 'package:eye_of_rovers/helpers/nasa_helper.dart';
import 'package:eye_of_rovers/models/photo/photo.dart';
import 'package:eye_of_rovers/models/rover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final Rover rover;
  const Gallery({Key? key, required this.rover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PhotosResponse>(
      future: NasaHelper.imagesBySol(rover: rover, sol: 1),
      builder: (context, snap) {
        if (snap.hasData && snap.data != null) {
          return GridView.count(
            crossAxisCount: 2,
            children: snap.data!.images
                .map((e) => ImageCard(
                      photo: e,
                      key: Key(e.id.toString()),
                    ))
                .toList(),
          );
        } else if (snap.hasError) {
          return Center(child: Text(snap.error.toString()));
        }
        return const Center(child: CupertinoActivityIndicator());
      },
    );
  }
}

class ImageCard extends StatelessWidget {
  final Photo photo;
  const ImageCard({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(photo.imageUrl),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            photo.roverName,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(photo.cameraName+' '+photo.earthDate.toString()),
            actions: <Widget>[
              Image.network(photo.imageUrl),
              CupertinoDialogAction(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //     title: Image.network(photo.imageUrl),
  //     subtitle: Text(photo.cameraName),
  //   );
  // }
}
