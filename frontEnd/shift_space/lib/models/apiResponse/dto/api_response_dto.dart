import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/airQuality/converter/air_quality.dart';
import 'package:shift_space/models/airQuality/dto/air_quality_dto.dart';
import 'package:shift_space/models/healthRisk/converter/health_risk_converter.dart';
import 'package:shift_space/models/healthRisk/dto/health_risk_dto.dart';
import 'package:shift_space/models/location/converter/location_converter.dart';
import 'package:shift_space/models/location/dto/location_dto.dart';
import 'package:shift_space/models/weather/converter/location_converter.dart';
import 'package:shift_space/models/weather/dto/weather_dto.dart';

part 'api_response_dto.g.dart';

@JsonSerializable()
class ApiResponseDTO {
  DateTime? date;
  int? id;

  @LocationConverter()
  LocationDTO? location;

  @WeatherConverter()
  WeatherDTO? weather;

  @JsonKey(name: 'health_risk')
  @HealthRiskConverter()
  HealthRiskDTO? healthRisk;

  @JsonKey(name: 'air_quality')
  @AirQualityConverter()
  AirQualityDTO? airQuality;

  ApiResponseDTO({
    this.date,
    this.id,
    this.location,
    this.weather,
    this.healthRisk,
    this.airQuality,
  });

  factory ApiResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseDTOToJson(this);
}
