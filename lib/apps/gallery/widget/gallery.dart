import 'package:eye_of_rovers/apps/gallery/bloc/filter_bloc.dart';
import 'package:eye_of_rovers/models/rover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_card.dart';

class Gallery extends StatefulWidget {
  final Rover rover;
  const Gallery({Key? key, required this.rover}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late FilterBloc _filterBloc;

  @override
  void initState() {
    _filterBloc = FilterBloc(rover: widget.rover)..add(AddFilter('FHAZ', 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.rover.name),
      ),
      child: BlocBuilder(
        bloc: _filterBloc,
        builder: (context, state) {
          if (state is FilterResult) {
            return Center(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                children: state.photos
                    .map((e) => ImageCard(
                          photo: e,
                          key: Key(e.id.toString()),
                        ))
                    .toList(),
              ),
            );
          } else if (state is FilterError) {
            return Center(child: Text(state.message));
          } else {
            //for loading state. There is no other states 
            return const Center(child: CircularProgressIndicator());
          }

        },
      ),
      // child: FutureBuilder<PhotosResponse>(
      //   future: NasaHelper.imagesBySol(rover: rover, sol: 1, camera: 'FHAZ'),
      //   builder: (context, snap) {
      //     if (snap.hasData && snap.data != null) {
      //       return Center(
      //         child: GridView.count(
      //           crossAxisCount: 2,
      //           childAspectRatio: 0.8,
      //           children: snap.data!.photos
      //               .map((e) => ImageCard(
      //                     photo: e,
      //                     key: Key(e.id.toString()),
      //                   ))
      //               .toList(),
      //         ),
      //       );
      //     } else if (snap.hasError) {
      //       return Center(child: Text(snap.error.toString()));
      //     }
      //     return const Center(child: CupertinoActivityIndicator());
      //   },
      // ),
    );
  }
}
