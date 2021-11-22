import 'package:eye_of_rovers/models/photo/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
              photo.imageUrl,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('😢 Failed to load image');
              },
            ).image,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                photo.cameraName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                photo.sol.toString() + ' Sol',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(photo.cameraName + ' ' + photo.earthDate.toString()),
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
}