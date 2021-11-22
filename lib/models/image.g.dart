// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      json['id'] as int,
      json['sol'] as int,
      json['earth_date'] as String,
      json['camera']['name'] as String,
      json['img_src'] as String,
      json['rover']['name'] as String,
    );//I editted my self to make it faster for child fields

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'sol': instance.sol,
      'earthDate': instance.earthDate,
      'roverName': instance.roverName,
      'cameraName': instance.cameraName,
      'imageUrl': instance.imageUrl,
    };
