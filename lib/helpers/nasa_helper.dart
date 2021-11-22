import 'dart:convert';

import 'package:eye_of_rovers/models/image.dart';
import 'package:http/http.dart' as http;

enum Rover {curiosity, opportunity, spirit}
class NasaHelper {

  static String _getRoverName(Rover rover) =>rover.toString().split('.').last;

  static Future<ImagesResponse> imagesBySol({required Rover rover,required int sol}) async {
    var response = await http.get(Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/${_getRoverName(rover)}/photos?sol=$sol&api_key=DEMO_KEY'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> images = data['photos']; 
      return ImagesResponse(images.map((e) => Image.fromJson(e)));
    }
    throw StateError('Error while requesting' + response.statusCode.toString());
  }
}

class ImagesResponse {
  final Iterable<Image> images;

  ImagesResponse(this.images);
}
