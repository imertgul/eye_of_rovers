import 'dart:convert';

import 'package:eye_of_rovers/models/image.dart';
import 'package:http/http.dart' as http;

class NasaHelper {
  static Future<Iterable<Image>> imagesBySol(String sol) async {
    var response = await http.get(Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=$sol&api_key=DEMO_KEY'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> images = data['photos']; 
      return images.map((e) => Image.fromJson(e));
    }
    throw StateError('Error while requesting' + response.statusCode.toString());
  }
}
