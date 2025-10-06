import 'package:json_annotation/json_annotation.dart';
import 'package:shift_space/models/airQuality/dto/air_quality_dto.dart';

class AirQualityConverter
    implements JsonConverter<AirQualityDTO, Map<String, dynamic>> {
  const AirQualityConverter();

  @override
  AirQualityDTO fromJson(Map<String, dynamic> json) {
    return AirQualityDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AirQualityDTO userDTO) {
    return userDTO.toJson();
  }
}
