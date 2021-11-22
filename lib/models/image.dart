import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  final int id;
  final int sol;
  @JsonKey(name: 'earth_date')
  final String earthDate;
  final String roverName;
  final String cameraName;
  @JsonKey(name: 'img_src')
  final String imageUrl;

  Image(this.id, this.sol, this.earthDate, this.cameraName, this.imageUrl, this.roverName);
  
  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}