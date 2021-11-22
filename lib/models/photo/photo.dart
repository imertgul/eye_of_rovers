import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  final int id;
  final int sol;
  @JsonKey(name: 'earth_date')
  final String earthDate;
  final String roverName;
  final String cameraName;
  @JsonKey(name: 'img_src')
  final String imageUrl;

  Photo(this.id, this.sol, this.earthDate, this.cameraName, this.imageUrl, this.roverName);
  
  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}