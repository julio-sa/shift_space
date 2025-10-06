// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityDTO _$AirQualityDTOFromJson(Map<String, dynamic> json) =>
    AirQualityDTO(
      pm25: (json['pm25_aqi'] as num?)?.toDouble(),
      o3: (json['o3_aqi'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AirQualityDTOToJson(AirQualityDTO instance) =>
    <String, dynamic>{'pm25_aqi': instance.pm25, 'o3_aqi': instance.o3};
