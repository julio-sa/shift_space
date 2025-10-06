// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDTO _$LocationDTOFromJson(Map<String, dynamic> json) => LocationDTO(
  id: (json['id'] as num?)?.toInt(),
  lat: (json['lat'] as num?)?.toDouble(),
  lon: (json['lon'] as num?)?.toDouble(),
  zipCode: json['zip_code'] as String?,
);

Map<String, dynamic> _$LocationDTOToJson(LocationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'zip_code': instance.zipCode,
    };
