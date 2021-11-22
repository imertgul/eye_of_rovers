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
  late Camera selectedCamera;
  late int selectedSol;

  @override
  void initState() {
    selectedCamera = widget.rover.availableCameras.first;
    selectedSol = 100;

    _filterBloc = FilterBloc(rover: widget.rover)
      ..add(AddFilter(selectedCamera, selectedSol));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.rover.name),
        trailing: CupertinoButton(
          child: const Text("Add Filter"),
          padding: const EdgeInsets.all(0),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                var pickerSol = CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedSol,
                  ),
                  itemExtent: 32.0,
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (int index) {},
                  children: List<Widget>.generate(
                    2000,
                    (int index) {
                      return Center(
                        child: Text('$index sol'),
                      );
                    },
                  ),
                );

                var pickerCamera = CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem:
                        widget.rover.availableCameras.indexOf(selectedCamera),
                  ),
                  itemExtent: 32.0,
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (int index) {},
                  children: widget.rover.availableCameras
                      .map((e) => Text(e.toString().split('.').last))
                      .toList(),
                );

                return Container(
                  height: 300.0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: pickerSol,
                            ),
                            Expanded(
                              child: pickerCamera,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CupertinoButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          CupertinoButton(
                              child: const Text('Add'),
                              onPressed: () {
                                selectedCamera = widget.rover.availableCameras[
                                    pickerCamera
                                        .scrollController!.selectedItem];
                                selectedSol =
                                    pickerSol.scrollController!.selectedItem;
                                _filterBloc.add(
                                    AddFilter(selectedCamera, selectedSol));
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      child: BlocBuilder(
        bloc: _filterBloc,
        builder: (context, state) {
          if (state is FilterResult) {
            if (state.photos.isEmpty) {
              return const Center(
                  child: Text('There are no photos for given filters'));
            }
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
            return const Center(child: CupertinoActivityIndicator());
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
