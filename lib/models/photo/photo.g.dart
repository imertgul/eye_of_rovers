// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      json['id'] as int,
      json['sol'] as int,
      json['earth_date'] as String,
      json['camera']['name'] as String,
      json['img_src'] as String,
      json['rover']['name'] as String,
    );//I editted my self to make it faster for child fields

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'sol': instance.sol,
      'earthDate': instance.earthDate,
      'roverName': instance.roverName,
      'cameraName': instance.cameraName,
      'imageUrl': instance.imageUrl,
    };
