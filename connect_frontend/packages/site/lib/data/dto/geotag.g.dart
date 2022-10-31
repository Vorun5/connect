// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geotag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Geotag _$$_GeotagFromJson(Map<String, dynamic> json) => _$_Geotag(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_GeotagToJson(_$_Geotag instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
