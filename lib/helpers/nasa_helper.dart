import 'dart:convert';


import 'package:eye_of_rovers/models/photo/photo.dart';
import 'package:eye_of_rovers/models/rover.dart';
import 'package:eye_of_rovers/nasa_api_key.dart';
import 'package:http/http.dart' as http;

class NasaHelper {


  static Future<PhotosResponse> imagesBySol({required Rover rover,required int sol, required String camera}) async {
    var response = await http.get(Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/${rover.name}/photos?sol=$sol&camera=$camera&api_key=$apikey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> images = data['photos']; 
      return PhotosResponse(images.map((e) => Photo.fromJson(e)));
    }
    throw StateError('Error while requesting' + response.statusCode.toString());
  }
}

class PhotosResponse {
  final Iterable<Photo> photos;

  PhotosResponse(this.photos);
}
