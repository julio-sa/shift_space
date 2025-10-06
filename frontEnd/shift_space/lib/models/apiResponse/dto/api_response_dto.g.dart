// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseDTO _$ApiResponseDTOFromJson(Map<String, dynamic> json) =>
    ApiResponseDTO(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      id: (json['id'] as num?)?.toInt(),
      location: _$JsonConverterFromJson<Map<String, dynamic>, LocationDTO>(
        json['location'],
        const LocationConverter().fromJson,
      ),
      weather: _$JsonConverterFromJson<Map<String, dynamic>, WeatherDTO>(
        json['weather'],
        const WeatherConverter().fromJson,
      ),
      healthRisk: _$JsonConverterFromJson<Map<String, dynamic>, HealthRiskDTO>(
        json['health_risk'],
        const HealthRiskConverter().fromJson,
      ),
      airQuality: _$JsonConverterFromJson<Map<String, dynamic>, AirQualityDTO>(
        json['air_quality'],
        const AirQualityConverter().fromJson,
      ),
    );

Map<String, dynamic> _$ApiResponseDTOToJson(ApiResponseDTO instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'id': instance.id,
      'location': _$JsonConverterToJson<Map<String, dynamic>, LocationDTO>(
        instance.location,
        const LocationConverter().toJson,
      ),
      'weather': _$JsonConverterToJson<Map<String, dynamic>, WeatherDTO>(
        instance.weather,
        const WeatherConverter().toJson,
      ),
      'health_risk': _$JsonConverterToJson<Map<String, dynamic>, HealthRiskDTO>(
        instance.healthRisk,
        const HealthRiskConverter().toJson,
      ),
      'air_quality': _$JsonConverterToJson<Map<String, dynamic>, AirQualityDTO>(
        instance.airQuality,
        const AirQualityConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
