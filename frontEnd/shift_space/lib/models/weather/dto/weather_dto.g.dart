// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDTO _$WeatherDTOFromJson(Map<String, dynamic> json) => WeatherDTO(
  id: (json['id'] as num?)?.toInt(),
  temperature: (json['temperature_c'] as num?)?.toDouble(),
  humidity: (json['humidity_percent'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherDTOToJson(WeatherDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperature_c': instance.temperature,
      'humidity_percent': instance.humidity,
    };
